class VideoSerializer < ActiveModel::Serializer
  attributes :id, :youtubeVid, :desc, :user, :topics, :slides
  
  def youtubeVid
    self.object.youtube_vid 
  end 
  def topics 
    selected = self.object.topics.map do |topic|
      {id: topic.id, content: topic.content}
    end 
    others = Topic.all.map do |topic|
      {id: topic.id, content: topic.content}
    end.delete_if {|topic| selected.include?(topic)} 
    return {
      selected: selected,
      others: others
    }
  end 

  def slides 
    self.object.slides.map do |slide| 
      sections = slide.sections.map do |section|
        {id: section.id,
         kind: section.kind,
         order: section.order,
         content: section.content,
         desc: section.desc,
         showDesc: section.show_desc
        }
      end 
      { 
        id: slide.id,
        videoId: slide.video_id,
        start: slide.start,
        title: slide.title,
        sections: sections
      }
    end 
  end 

  def user 
    {username: self.object.user.username, id: self.object.user.id}
  end 
  
end
