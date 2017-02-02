# frozen_string_literal: true
require 'cuba'
require 'gmail'
require 'mechanize'
require 'mote'
require 'mote/render'

LINK_REGEX = /https?:\/\/[^\"|^<]*/
IGNORE = ['http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd',
          'http://www.w3.org/1999/xhtml'].freeze
CONFIG = YAML.load_file(File.join(File.dirname(__FILE__), './config/config.local.yml'))

Cuba.plugin(Mote::Render)

Cuba.use Rack::Static,
         root: 'public',
         urls: ['/css', '/js', '/fonts']

Cuba.define do
  on get do
    if req.env['HTTP_AUTHORIZATION'] != ENV['clickitat_api']
      res.write '<h1>Invalid API key</h1>'
      return
    end

    on root do
      res.write view('home', title: 'Cuba Genie')
    end

    on 'openclick' do
      subject = req.params['subject']
      username = req.params['username']

      res.write "<h1>Opening links for email #{subject} at #{username}</h1>"

      a = Mechanize.new do |agent|
        agent.user_agent_alias = 'Mechanize'
      end

      gmail = Gmail.connect(username, CONFIG[username])
      message = gmail.mailbox('All').find(subject: subject).first

      if message
        body = message.body.parts[1].body.to_s
        body.scan(LINK_REGEX).each do |link|
          if IGNORE.include? link
            res.write "<p>ignoring #{link}</p>"
          else
            res.write "<p>clicking #{link}</p>"
            a.get(link)
          end
        end
      else
        res.write '<h1>No messages found</h1>'
      end
    end
  end
end
