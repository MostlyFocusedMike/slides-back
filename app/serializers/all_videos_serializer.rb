class AllVideosSerializer < ActiveModel::Serializer
  attributes :id, :desc, :youtubeVid,  :user, :topics
  def youtubeVid
    self.object.youtube_vid 
  end 

  def user
    {username: self.object.user.username, id: self.object.user.id}
  end

  def topics 
    selected = self.object.topics.map do |topic|
      {id: topic.id, content: topic.content}
    end 
    return {
      selected: selected,
    }
  end 


end 
