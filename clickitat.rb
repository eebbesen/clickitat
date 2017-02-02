require 'cuba'
require 'mote'
require 'mote/render'
require 'gmail'

Cuba.plugin(Mote::Render)

Cuba.use Rack::Static,
  root: 'public',
  urls: ['/css','/js', '/fonts']

Cuba.define do
  on get do
    on root do
      res.write view('home', {title: 'Cuba Genie'})
    end

    on 'openclick' do
      res.write 'Opening'
      gmail = Gmail.connect(req.params['username'], req.params['password'])
      c = gmail.mailbox('All').count
      res.write " #{c} emails"

      res.write 'Clicking'
    end
  end
end
  