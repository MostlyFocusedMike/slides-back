# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
User.destroy_all
Video.destroy_all
Slide.destroy_all
Section.destroy_all
Question.destroy_all
Topic.destroy_all
VideoTopic.destroy_all


tom = User.create(username: "tom", bio: "I'm just a test user, ho hum", email: "tom@gmail.com", password: "1234", pic_link: "https://vetstreet.brightspotcdn.com/dims4/default/f6e3702/2147483647/thumbnail/180x180/quality/90/?url=https%3A%2F%2Fvetstreet-brightspot.s3.amazonaws.com%2F17%2Fa85b40b3a511e092fe0050568d634f%2Ffile%2Fhub-cats-kitten.jpg") 

bob = User.create(username: "bob", bio: "I'm just a test questioner, ho hum", email: "bob@gmail.com", password: "1234", pic_link: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Cat03.jpg/1200px-Cat03.jpg") 
vid = Video.create(user: tom, youtube_vid: "2g811Eo7K8U", desc: "A cat falls over")

topic = Topic.create(content: "lecture")
Topic.create(content: "Coding Tutorial")
Topic.create(content: "Review")
Topic.create(content: "Cooking Tutorial")
vid.video_topics.create(topic: topic)
vid.questions.create(user: bob, content: "here's a q", timecode: "12")

slide1 = Slide.create(video: vid, title: "Section One")
slide2 = Slide.create(video: vid, title: "Section Two", start: 5)
slide3 = Slide.create(video: vid, title: "Section Three", start: 10)

slide1.sections.create(kind: 0, content: "Here's some text 1", order: 0)
slide1.sections.create(kind: 1, content: "here's \nsome \n<h1>code</h1> 1", desc: "", order: 1)
slide1.sections.create(kind: 2, content: "www.url.com", desc: "I'm a link 1", show_desc: true, order: 2)
slide1.sections.create(kind: 3, content: "www.picurl.com", desc: "I'm a picture 1", show_desc:true, order: 3)

slide2.sections.create(kind: 0, content: "Here's some text 2", order: 3)
slide2.sections.create(kind: 1, content: "here's \nsome \n<h1>code</h1> 2", desc: "", order: 1)
slide2.sections.create(kind: 2, content: "www.url.com", desc: "I'm a link 2", show_desc: true, order: 0)
slide2.sections.create(kind: 3, content: "www.picurl.com", desc: "I'm a picture 2", show_desc:true, order: 2)

slide3.sections.create(kind: 0, content: "Here's some text 3", order: 0)
slide3.sections.create(kind: 1, content: "here's \nsome \n<h1>code</h1> 3", desc: "", order: 3)
slide3.sections.create(kind: 2, content: "www.url.com", desc: "I'm a link 3", show_desc: true, order: 1)
slide3.sections.create(kind: 3, content: "www.picurl.com", desc: "I'm a picture 3", show_desc:true, order: 2)



