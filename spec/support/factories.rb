Factory.define :message do |m|
  m.name "Marcos"
  m.email "valid@valid.com"
  m.content "lorem"
end

Factory.define :user do |user|
  user.id 1
  user.email Faker::Internet.email
  user.password "password"
  user.password_confirmation "password"
end

Factory.define :entry do |entry|
  entry.id 1
  entry.name 'Lorem ipsum'
  entry.body 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
  entry.user_id 1
end

Factory.define :newer, :parent => :entry do |entry|
  entry.id 2
  entry.name 'newer'
  entry.body 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
  entry.user_id 1
  entry.created_at DateTime.now
  entry.status 'published'
  entry.type 'Post'
end

Factory.define :older, :parent => :entry do |entry|
  entry.id 3
  entry.name 'older'
  entry.body 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
  entry.user_id 1
  entry.created_at DateTime.yesterday
  entry.status 'published'
  entry.type 'Post'
end

Factory.define :draft, :parent => :entry do |entry|
  entry.id 4
  entry.name 'draft'
  entry.body 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
  entry.user_id 1
  entry.created_at DateTime.yesterday
  entry.status 'draft'
  entry.type 'Post'
end

Factory.define :static_page do |page|
  page.id 1
  page.title 'about'
  page.body 'this is the about page'
  page.group 'static'
  page.user_id 1
end

Factory.define :language do |lan|
  lan.id 1
  lan.name 'Ruby'
  lan.url 'http://www.ruby-lang.org'
end

Factory.define :snippet do |sni|
  sni.id 1
  sni.content "lorem"
  sni.private 0
  sni.public_sha '999999'
  sni.language_id 1
end

Factory.define :privsnippet, :parent => :snippet do |sni|
  sni.private 1
  sni.content "private lorem"
  sni.public_sha '999999999999'
  sni.user_id 1
end
