class FiguresController < ApplicationController
  
  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :"figures/new"
  end

  post '/figures' do
    if params[:figure][:name] != ""
      if params[:title][:name] != ""
        new_title = Title.create(params[:title])
        if params[:figure][:title_ids] == nil
          params[:figure][:title_ids] = [new_title.id]
        else
          params[:figure][:title_ids] << new_title.id
        end
      end
      if params[:landmark][:name] != ""
        new_landmark = Landmark.create(params[:landmark])
        if params[:figure][:landmark_ids] == nil
          params[:figure][:landmark_ids] = [new_landmark.id]
        else
          params[:figure][:landmark_ids] << new_landmark.id
        end
      end
      new_figure = Figure.create(params[:figure])
      redirect "/figures/#{new_figure.id}"
    end
  end

  get '/figures/:id' do
    @figure = Figure.all.find(params[:id])
    erb :"figures/show"
  end

  get '/figures/:id/edit' do
    @figure = Figure.all.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :"figures/edit"
  end

  patch '/figures/:id' do
    if params[:title][:name] != ""
      new_title = Title.create(params[:title])
      if params[:figure][:title_ids] == nil
        params[:figure][:title_ids] = [new_title.id]
      else
        params[:figure][:title_ids] << new_title.id
      end
    end
    if params[:landmark][:name] != ""
      new_landmark = Landmark.create(params[:landmark])
      if params[:figure][:landmark_ids] == nil
        params[:figure][:landmark_ids] = [new_landmark.id]
      else
        params[:figure][:landmark_ids] << new_landmark.id
      end
    end
    Figure.all.find(params[:id]).update(params[:figure])
    redirect "/figures/#{params[:id]}"
  end

end
