require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require_relative 'db_config'
require_relative 'models/login'
require_relative 'models/user'
require_relative 'models/artist'



enable :sessions # sinatra provides this feature

helpers do
	def current_user
		User.find_by(id: session[:username])
	end

	def logged_in?
		if current_user
			return true
		else
			return false
		end
	end
end



get '/' do
  erb :index
end

get '/artist_search' do 	
 	@apiartist_search = HTTParty.get("https://app.ticketmaster.com/discovery/v2/attractions?keyword=" + params[:artist] + 
 		"&apikey=IPV1sLy7BYk461O5tduCn3msaKpMxNGl")

 	@name = JSON.parse(@apiartist_search.parsed_response)["_embedded"]["attractions"][0]["name"]
	@image = JSON.parse(@apiartist_search.parsed_response)["_embedded"]["attractions"][0]["images"][2]["url"]


	# correct_search = @apievent_search = HTTParty.get("https://app.ticketmaster.com/discovery/v2/events?city=melbourne&keyword=" + params[:artist] + 
 # 		"&apikey=IPV1sLy7BYk461O5tduCn3msaKpMxNGl")


	# if correct_search
	# 	return true
	# else 
	# 	return false
#if they have events then display it, if not then send them to a page that says no upcoming events.


 	@apievent_search = HTTParty.get("https://app.ticketmaster.com/discovery/v2/events?city=" + params[:city] + 
 		"&keyword=" + params[:artist] + 
 		"&apikey=IPV1sLy7BYk461O5tduCn3msaKpMxNGl")


 	@res = JSON.parse(@apievent_search.parsed_response)

 	if @res["_embedded"].nil?
 		return erb(:noresultspage)
 	end

	@location = JSON.parse(@apievent_search.parsed_response)["_embedded"]["events"][0]["_embedded"]["venues"][0]["name"]
    @city = JSON.parse(@apievent_search.parsed_response)["_embedded"]["events"][0]["_embedded"]["venues"][0]["city"]["name"]
 	@state = JSON.parse(@apievent_search.parsed_response)["_embedded"]["events"][0]["_embedded"]["venues"][0]["state"]["name"]
 	@country = JSON.parse(@apievent_search.parsed_response)["_embedded"]["events"][0]["_embedded"]["venues"][0]["country"]["name"]
 	@date =  JSON.parse(@apievent_search.parsed_response)["_embedded"]["events"][0]["dates"]["start"]["localDate"]
 	@time = JSON.parse(@apievent_search.parsed_response)["_embedded"]["events"][0]["dates"]["start"]["localTime"]


		# JSON.parse(@apievent_search.parsed_response)["_embedded"]["events"]

		# #.each method to loop through all of them

		# [0]["_embedded"]["venues"][0]["name"]

		# #class and methods to call methods and It finds it for you. 

erb :artist_search
end




post '/signuppage' do
	user = User.new
	user.username = params[:username]
	user.email = params[:email]
	user.password = params[:password]
	user.save
	redirect "/login"
end

get '/signuppage' do
	erb :signuppage
end


get '/login' do 
	erb :login
end 




get '/noresultspage' do 	
 	@apiartist_search = HTTParty.get("https://app.ticketmaster.com/discovery/v2/attractions?keyword=" + params[:artist] + 
 		"&apikey=IPV1sLy7BYk461O5tduCn3msaKpMxNGl")

 	@name = JSON.parse(@apiartist_search.parsed_response)["_embedded"]["attractions"][0]["name"]
	@image = JSON.parse(@apiartist_search.parsed_response)["_embedded"]["attractions"][0]["images"][2]["url"]


	erb :noresultspage
end 









# own artists 



get '/myartists' do 
	unless session[:user_id]
		redirect '/login' unless logged_in?
	end
	erb :myartists
end 




post '/createevent' do
	artist = Artist.new
	artist.nameofartist = params[:nameofartist]
	artist.image_url = params[:image_url]
	artist.bio = params[:bio]
	artist.save
	redirect "/myprofile"
end


get '/createevent' do 
	unless session[:user_id]
		redirect '/login' unless logged_in?
	end
	erb :createevent
end 


post '/createartist' do 
	artist.tourevent = params[:tourevent]
	artist.address = params[:address]
	artist.city = params[:city]
	artist.dateofconcert = params[:dateofconcert]
	artist.timeofconcert = params[:timeofconcert]
	artist.save
	redirect "/myprofile"
	
end 

get '/createartist' do 
	unless session[:user_id]
		redirect '/login' unless logged_in?
	end
	erb :createartist
end 




get '/about' do 
	erb :about
end 






get '/myprofile' do 

get '/about' do 
	erb :about
end 

@artist = Artist.where(user_id: @dish.id)

find(params[:id])


	erb :myprofile
end 




post '/session' do
	#check email exists
	user = User.find_by(email: params[:email])

	#check password
	if user && user.authenticate(params[:password])
		# have a user and authenticate return thruthy
		session[:username] = user.id #just a hash
		redirect '/'
	else
		erb :login
	end
end

delete '/session' do
	session[:username] = nil
	redirect '/login'
	end



























