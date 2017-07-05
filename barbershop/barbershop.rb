require 'sinatra'

get '/' do
	erb :index
end

post '/' do
	# Присваиваем переменным значения введенные в форму
	@name = params[:user_name]
	@phone = params[:phone]
	@date = params[:date_time]

	@title = 'Thank you!'
	@message = "Dear #{@name}, we'll be waitng for you at #{@date}"

	# Добавляем имя, телефон и дату в файл users.txt и закрываем файл
	file = File.open('users.txt', 'a')
	file.write("Name: #{@name}, Phone: #{@phone}, Date and time: #{@date}\n")
	file.close
	
	erb :message
end
