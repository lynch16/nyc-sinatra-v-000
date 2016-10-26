class FiguresController < ApplicationController

    get '/figures' do
        @figures = Figure.all
        erb :'/figures/index'
    end

    get '/figures/new' do
        @landmarks = Landmark.all
        @titles = Title.all
        erb :'/figures/new'
    end

    post '/figures' do
        @figure = Figure.new(params[:figure])

        if !params[:landmark][:name].empty?
            @landmark = Landmark.new(params[:landmark])
            @figure.landmarks << @landmark
        end
        if !params[:title][:name].empty?
            @title = Title.new(params[:title])
            @figure.titles << @title
        end
        @figure.save
        redirect '/figures'
    end

    post '/figures/:id' do
        @figure = Figure.find(params[:id])
        @figure.name = params[:figure][:name]
        if !params[:landmark][:name].empty?
            @landmark = Landmark.new(params[:landmark])
            @figure.landmarks << @landmark
        end
        if !params[:title][:name].empty?
            @title = Title.new(params[:title])
            @figure.titles << @title
        end
        @figure.save
        redirect "/figures/#{@figure.id}"
    end

    get '/figures/:id' do
        @figure = Figure.find(params[:id])
        erb :'/figures/show'
    end

    get '/figures/:id/edit' do
        @landmarks = Landmark.all
        @titles = Title.all
        @figure = Figure.find(params[:id])
        erb :'/figures/edit'
    end
end
