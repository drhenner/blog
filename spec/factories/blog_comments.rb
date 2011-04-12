# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define 'Blog::BlogComment' do |f|
#Factory.define :blog_comment do |f|
  f.title       "My Blog Title"
  f.email       "drhenner@yahoo.com"
  f.website     "MyString"
  f.post_id     1
  f.content     "MyText"
  f.permalink   "MyString"
  f.user_ip     "192.168.0.1"
  f.user_agent  "MyString"
  f.referrer    "MyString"
  f.admin false
end