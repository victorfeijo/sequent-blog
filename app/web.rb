require 'sinatra/base'
require 'sinatra/flash' # for displaying flash messages
require 'sinatra/reloader' # for hot reloading changes we make
require_relative '../sequent_blog'

class Web < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
  end

  after do
    Sequent::ApplicationRecord.clear_active_connections!
  end

  get '/' do
    erb :index
  end

  post '/authors' do
    author_id = Sequent.new_uuid
    command = AddAuthor.from_params(params.merge(aggregate_id: author_id))

    Sequent.command_service.execute_commands(*command)

    flash[:notice] = 'Author created'
    redirect '/'
  end

  get '/authors/:aggregate_id' do
    @author = AuthorRecord.find_by(aggregate_id: params[:aggregate_id])

    erb :'authors/show'
  end

  get '/authors' do
    @authors = AuthorRecord.all

    erb :'authors/index'
  end

  helpers ERB::Util
end
