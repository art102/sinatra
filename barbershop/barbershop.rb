require 'sinatra'

get '/' do
	erb :index
end

post '/' do
	erb :index

	@name = params[:user_name]
	@phone = params[:phone]
	@date = params[:date_time]

	@title = 'Thank you!'
	@message = "Dear #{@name}, we'll be waitng for you at #{@date}"

	erb :message
end
