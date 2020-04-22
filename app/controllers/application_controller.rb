require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do 
      erb :team
    end

    post '/teams' do
      @team = Team.new(name: params[:team][:name], motto: params[:team][:motto]) 
      
      params[:team][:members].each do |m|
        Hero.new(name: m[:name], power: m[:power], bio: m[:bio])
      end

      @heroes = Hero.all

      erb :super_hero
    end
end
