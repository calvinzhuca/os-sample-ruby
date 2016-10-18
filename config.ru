require 'bundler/setup'

Bundler.require(:default)

class Application < Sinatra::Base

  get '/' do
    ENV.inspect
  end

get '/process' do
  "please use url /process to process credit card transaction"
end

end

run Application
