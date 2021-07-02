require_relative 'config/environment'
require_relative 'models/piglatinizer.rb'

class App < Sinatra::Base

    get '/' do
        erb :user_input
    end

    post '/piglatinize' do
        @word = params["user_phrase"]
        @piglat = PigLatinizer.new
        @latinized_word = @piglat.piglatinize(@word)

        #binding.pry
        erb :piglatinized
    end
end