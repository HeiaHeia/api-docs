require 'bundler/setup'

Bundler.require(:default)
Bundler.require(ENV['RACK_ENV'].to_sym) if ENV['RACK_ENV']

class App < Sinatra::Base

  set :server, :puma

  configure :production do
    disable :dump_errors
  end

  get '/' do
    redirect '/index.html'
  end

  run! if app_file == $0
end

