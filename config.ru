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


post '/process' do
 begin
  post_data =  JSON.parse request.body.read
  if post_data.nil? or !post_data.has_key?('creditCardNumber')  or !post_data.has_key?('verificationCode')
   puts "ERROR!!!!!!!!"
  else
   	transcation = Transcation.new 
	transcation.creditCardNumber = post_data['creditCardNumber']
	transcation.expMonth = post_data['expMonth']
	transcation.expYear = post_data['expYear']
	transcation.verificationCode = post_data['verificationCode']
	transcation.billingAddress = post_data['billingAddress']
	transcation.customerName = post_data['customerName']
	transcation.orderNumber = post_data['orderNumber']
	transcation.amount = post_data['amount']

	  puts "creditCardNumber  #{transcation.creditCardNumber}"
	  puts "expMonth          #{transcation.expMonth}"
	  puts "expYear           #{transcation.expYear}"
	  puts "billingAddress    #{transcation.billingAddress}"
	  puts "customerName      #{transcation.customerName}"
	  puts "orderNumber       #{transcation.orderNumber}"
	  puts "amount            #{transcation.amount}"

	result = Result.new
	result.name = transcation.customerName
	result.orderNumber = transcation.orderNumber
	result.transactionDate = DateTime.now
	result.transactionNumber = 9000000 + rand(1000000)

	if transcation.expYear.to_i < Time.now.year.to_i or (transcation.expYear.to_i == Time.now.year.to_i and transcation.expMonth.to_i <= Time.now.month.to_i)
		result.status = "FAILURE"
	else
		result.status = "SUCCESS"
	end

	result.to_json

  end
 end
end




end

run Application
