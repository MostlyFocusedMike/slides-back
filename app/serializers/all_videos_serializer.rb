class AllVideosSerializer < ActiveModel::Serializer
  attributes :id, :desc, :youtube_vid,  :user, :topics
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
