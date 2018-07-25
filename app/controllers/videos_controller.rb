class VideosController < ApplicationController
  before_action :set_video, only: [:show]
  def index 
    render json: Video.all, each_serializer: AllVideosSerializer
  end 

  def show 
    render json: @video, serializer: SingleVideoSerializer
  end 
  
  def create
    user = User.find(params["videos"]["0"]["user"]["id"])
    video = user.videos.create(params["videos"]["0"].permit("desc", "youtube_vid"))
    slides = params["slides"]
    sections = params["sections"]
    slides.each do |k,slide| 
      slide = slide.permit("start", "title")
      db_slide = video.slides.create(slide)
      slides[k]["sections"].each do |slideId|
        section = sections[slideId.to_s].permit("kind", "order", "content", "desc", "show_desc")
        db_slide.sections.create(section)
      end 
    end
  end 
  private 
    def video_params
    end 

    def set_video
      @video = Video.find(params[:id])
    end 
end
