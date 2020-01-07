require 'rubygems'
require 'bundler'

Bundler.require

set :database, {adapter: "sqlite3", database: "app.sqlite3"}

class Contact < ActiveRecord::Base
end

class Tweet < ActiveRecord::Base
end

get '/' do
  @tweets = Tweet.all
  erb :index
end

get '/tweets/new' do
  erb :new
end

post '/tweets' do
  tweet = Tweet.new
  tweet.text = params[:text]
  tweet.image = params[:image]
  tweet.save
  redirect '/'
end
