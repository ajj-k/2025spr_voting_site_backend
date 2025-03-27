require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models.rb'

before do
  response.headers['Access-Control-Allow-Origin'] = '*'
  response.headers['Access-Control-Allow-Methods'] = 'GET, POST, OPTIONS'
  response.headers['Access-Control-Allow-Headers'] = 'Content-Type'
end

options "*" do
  200
end

post "/:id/count" do
  mentor = Mentor.find_by(id: params[:id])
  if mentor
    item.increment!(:voting)
    content_type :json
    { id: mentor.id, name: mentor.name, voting: mentor.voting }.to_json
  else
    status 404
    { error: "Mentor not found" }.to_json
  end
end