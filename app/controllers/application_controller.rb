require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        erb :new
    end

    post '/teams' do
        @team = params[:team]
        @member1 = params[:team][:members][0]
        @member2 = params[:team][:members][1]
        @member3 = params[:team][:members][2]

        erb :created
    end

end
