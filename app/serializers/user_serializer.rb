class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :bio, :pic_link, :videos
  def videos 
    self.object.videos.map do |video|
      topics = video.topics.map do |topic|
        {id: topic.id, content: topic.content}
      end
      {id: video.id,
       youtube_vid: video.youtube_vid,
       desc: video.desc,
       topics: topics

      }
    end
  end 
end
