class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :bio, :picLink, :videos
  def picLink
    self.object.pic_link
  end 
  def videos 
    self.object.videos.map do |video|
      topics = video.topics.map do |topic|
        {id: topic.id, content: topic.content}
      end
      {id: video.id,
       youtubeVid: video.youtube_vid,
       desc: video.desc,
       topics: topics

      }
    end
  end 
end
