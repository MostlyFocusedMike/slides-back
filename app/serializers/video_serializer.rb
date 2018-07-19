class VideoSerializer < ActiveModel::Serializer
  attributes :id, :youtube_vid, :desc, :topics, :slides, 
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
         show_desc: section.show_desc
        }
      end 
      {id: slide.id,
       video_id: slide.video_id,
       start: slide.start,
       title: slide.title,
       sections: sections
      }
    end 
  end 
  
end
