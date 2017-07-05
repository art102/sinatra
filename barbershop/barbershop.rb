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

get '/admin' do
	erb :admin_page
end

post '/admin' do
	@admin = params[:admin_user]
	@pass = params[:passwd]

	if @admin == 'admin' && @pass == 'pa$$word'
		@users_list = File.open("users.txt","r")
		erb :list_users
		@users_list.close
	else
		erb :admin_page
	end
end
