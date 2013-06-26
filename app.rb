ENV['RACK_ENV'] ||= 'development'

require 'rubygems'
require 'bundler/setup'
Bundler.require(:default, ENV['RACK_ENV'].to_sym)

require_relative 'stubs/feed_stub'

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

  get '/v2/feeds/:id' do
    puts params.inspect
    body 'OK'
    status 200
  end

  get '/v2/feeds' do
    api_url   = 'https://api.heiaheia.com/v2/feeds'
    prev_link = "&lt;#{api_url}?since=#{params[:since]}&per_page=#{params[:per_page]}&direction=desc&gt;; rel=\"prev\""
    next_link = "&lt;#{api_url}?since=#{params[:since]}&per_page=#{params[:per_page]}&direction=desc&gt;; rel=\"next\""
    new_link  = "&lt;#{api_url}?since=2&per_page=#{params[:per_page]}&direction=desc&gt;; rel=\"new\""

    links = [next_link]
    if params[:since]
      links << prev_link
    else
      links << new_link
    end

    headers['Link'] = links.join(', ')

    body FeedStub.feeds.to_json

    status 200
  end

  run! if app_file == $0
end

# FIXME: Fix usage of models with $ref
# FIXME: swagger.js:369
