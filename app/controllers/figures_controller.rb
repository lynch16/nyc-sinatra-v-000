class FiguresController < ApplicationController

    get '/figures' do
        erb :'/figures/index'
    end

    get '/figures/new' do
        erb :'/figures/new'
    end

    post '/figures/:id' do
    end

    get '/figures/:id' do
        erb :'/figures/show'
    end
end
