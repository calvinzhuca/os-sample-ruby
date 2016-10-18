require 'bundler/setup'

Bundler.require(:default)

class Application < Sinatra::Base

  get '/' do
    ENV.inspect
  end

get '/process' do
  "please use post method on url/process to handle credit card transaction"
end






get '/refund/:transactionNumber' do
	"refund for '#{params[:transactionNumber]}'"
end

post '/refund' do
	"refund for transcation number #{params[:id]}"
end







end

run Application
