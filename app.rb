ENV['RACK_ENV'] ||= 'development'

def path_to(folder)
  File.expand_path("../#{folder}", __FILE__)
end

$LOAD_PATH << path_to('lib') << path_to('stubs')

require 'rubygems'
require 'bundler/setup'
Bundler.require(:default, ENV['RACK_ENV'].to_sym)

require 'feed_stub'
require 'user_stub'
require 'const'

Dir.glob("#{path_to('helpers')}/**/*_helper.rb")  { |f| require(f) }

class App < Sinatra::Base

  set :server, :puma

  configure :production do
    disable :dump_errors
  end

  not_found do
    'Record not found'
  end

  helpers ErrorHelper, ParamsHelper, ModelsHelper, UrlHelper

  get '/' do
    redirect '/index.html'
  end

  get '/:api_version/api-docs/*.json' do
    erb request.path.to_sym
  end

  get '/authorization' do
    erb :'authorization'
  end

  get '/authentication' do
    erb :'authentication'
  end

  get '/error-and-responses' do
    erb :'error-and-responses'
  end

  get '/date-format' do
    erb :'date-format'
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
    feed = FeedStub.find(params[:id])
    not_found if feed.nil?
    body feed.to_json
    status 200
  end

  get '/v2/feeds' do
    api_url   = "#{Const::BASE_PATH}/feeds"
    prev_link = "&lt;#{api_url}?since=#{params[:since]}&per_page=#{params[:per_page]}&direction=desc&gt;; rel=\"prev\""
    next_link = "&lt;#{api_url}?since=#{params[:since]}&per_page=#{params[:per_page]}&direction=desc&gt;; rel=\"next\""
    new_link  = "&lt;#{api_url}?since=2&per_page=#{params[:per_page]}&direction=asc&gt;; rel=\"new\""

    links = [next_link]
    if params[:since]
      links << prev_link
    else
      links << new_link
    end

    headers['Link'] = links.join(', ')

    body FeedStub.all.map { |entry| entry.to_hash }.to_json
    status 200
  end

  get '/v2/users/:id' do
    puts params.inspect
    entry = UserStub.find(params[:id])
    not_found if entry.nil?
    body entry.to_json
    status 200
  end

  run! if app_file == $0
end

# FIXME: Fix usage of models with $ref
# FIXME: swagger.js:359

# TODO: Add properties or #name? to entries
# TODO: Add property items_url to users

# TODO: Add resource /items
# TODO: Add resource /items/years
# TODO: Add resource /users/{user_id}/items
# TODO: Add resource /users/{user_id}/items/years
