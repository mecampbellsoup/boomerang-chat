require 'faye'
Faye::WebSocket.load_adapter('thin')

require File.expand_path('../config/initializers/faye_token.rb', __FILE__)

class ServerAuth
  def incoming(message, callback)
    if message['channel'] !~ %r{^/meta/}
      if message['ext']['auth_token'] != FAYE_TOKEN
        message['error'] = 'Invalid authentication token'
      end
    end
    callback.call(message)
  end
end

logger = Logger.new('log/faye.log')
faye_server = Faye::RackAdapter.new(:mount => '/faye', :timeout => 45)
faye_server.add_extension(ServerAuth.new)
use Rack::CommonLogger, logger
run faye_server