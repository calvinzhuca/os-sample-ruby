require 'bundler/setup'

Bundler.require(:default)

class Application < Sinatra::Base

  get '/' do
  "please use url /process to process credit card transaction"

    ENV.inspect
  end

end

run Application
