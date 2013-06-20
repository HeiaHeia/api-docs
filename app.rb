require 'bundler/setup'

ENV['RACK_ENV'] ||= 'development'

Bundler.require(:default)
Bundler.require(ENV['RACK_ENV'].to_sym)

class App < Sinatra::Base

  set :server, :puma

  configure :production do
    disable :dump_errors
  end

  get '/' do
    redirect '/index.html'
  end

  post '/v2/training_logs' do
    #body 'OK'
    body params.inspect
    status 200
  end

  run! if app_file == $0
end

