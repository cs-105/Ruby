#writen by Taylor Birchem (10/19/2021)
#last modified by Joshua Cross (11/6/2021)
require 'sinatra'
require_relative 'test.rb'

set :protection, :except => :frame_options
set :bind, '0.0.0.0'
set :port, 8080
#Josh here, the next line is a call to my test code. It can be commented out when not testing my code
joshTestFunction

get '/' do
  'Window that simulation will run in... This is a rough prototype and will be updated as project goes on.'
end