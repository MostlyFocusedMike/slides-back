class VideosController < ApplicationController
  before_action :set_video, only: [:show]
  def index 
    render json: Video.all
  end 

  def show 
    render json: @video 
  end 

  private 
    def video_params
    end 

    def set_video
      @video = Video.find(params[:id])
    end 
end
