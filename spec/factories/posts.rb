# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :post do |f|
  f.title       "MyString"
  f.content     "MyText"
  f.markdown    "MyText"
  f.posted_at   "2011-04-11 23:41:40"
  f.user_id     1
  f.state       "MyString"
end