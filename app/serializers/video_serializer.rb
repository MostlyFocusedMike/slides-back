class VideoSerializer < ActiveModel::Serializer
  attributes :id, :youtube_vid, :desc, :slides

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
