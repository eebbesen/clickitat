
require "cuba"
require "mote"
require "mote/render"

Cuba.plugin(Mote::Render)

Cuba.use Rack::Static,
  root: "public",
  urls: ["/css","/js", "/fonts"]

Cuba.define do
  on root do
    res.write view("home", {title: "Cuba Genie"})
  end
end

Cuba.define do
  on get do
    on 'openclick' do
      res.write 'Opening'
      res.write 'Clicking'
    end
  end
end
  