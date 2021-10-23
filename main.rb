#writen by Taylor Birchem (10/19/2021)
#last modified by Taylor Birchem (10/19/2021)

require 'sinatra'

set :protection, :except => :frame_options
set :bind, '0.0.0.0'
set :port, 8080

get '/' do
  'Window that simulation will run in... This is a rough prototype and will be updated as project goes on.'
end
