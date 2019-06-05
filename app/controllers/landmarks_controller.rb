class LandmarksController < ApplicationController
  
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :"landmarks/index"
  end

  get '/landmarks/new' do
    @figures = Figure.all
    @landmarks = Landmark.all
    erb :"landmarks/new"
  end

  post '/landmarks' do
    new_landmark = Landmark.create(params)
    redirect "/landmarks/#{new_landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.all.find(params[:id])
    erb :"landmarks/show"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.all.find(params[:id])
    @figures = Figure.all
    erb :"landmarks/edit"
  end

  patch '/landmarks/:id' do
    new_landmark=Landmark.all.find(params[:id])
    new_landmark.update(params[:landmark])
    redirect "/landmarks/#{new_landmark.id}"
  end

end
