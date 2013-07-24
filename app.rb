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

  helpers ErrorHelper, PaginatorHelper, ModelsHelper

  get '/' do
    redirect '/index.html'
  end

  get '/v2/api-docs/*.json' do
    erb request.path.to_sym
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
# FIXME: swagger.js:369
# TODO: Add client_app to all entries
# TODO: Add resource TrainingGoal
# TODO: Add resource Medal
# TODO: Add resource TopSport
# TODO: Add model SportParamValue
# TODO: Fix sport_params params[:name] => params[:id]
# TODO: Add properties or #name? to entries


# GET  /threads
# GET  /threads/unread
# GET  /threads/:id/messages
# POST /threads/:id/messages

# GET  /messages/:id
# PUT  /messages/:id
