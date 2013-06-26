ENV['RACK_ENV'] ||= 'development'

require 'rubygems'
require 'bundler/setup'
Bundler.require(:default, ENV['RACK_ENV'].to_sym)

class App < Sinatra::Base

  set :server, :puma

  configure :production do
    disable :dump_errors
  end

  get '/' do
    redirect '/index.html'
  end

  post '/v2/training_logs' do
    puts params.inspect
    body 'OK'
    status 200
  end

  get '/v2/training_logs/:id' do
    puts params.inspect
    body 'OK'
    status 200
  end

  put '/v2/training_logs/:id' do
    puts params.inspect
    body 'OK'
    status 200
  end

  delete '/v2/training_logs/:id' do
    puts params.inspect
    body 'OK'
    status 200
  end

  get '/v2/sports' do
    puts params.inspect
    body 'OK'
    status 200
  end

  get '/v2/sports/:id' do
    puts params.inspect
    body 'OK'
    status 200
  end

  run! if app_file == $0
end

