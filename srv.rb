require 'webrick'

op = { BindAddress:  '127.0.0.1', Port: 3000, DocumentRoot: '.' }
server = WEBrick::HTTPServer.new(op)

server.mount_proc('/') do |req, res|
  res['Pragma'] = 'no-cache'
  res.set_redirect(WEBrick::HTTPStatus::MovedPermanently, "http://#{req.host}/")
end

server.start
