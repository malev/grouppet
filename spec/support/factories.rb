Factory.define :user do |user|
  user.id 1
  user.email Faker::Internet.email
  user.password "password"
  user.password_confirmation "password"
end

Factory.define :post do |post|
  post.id 1
  post.title 'Lorem ipsum'
  post.body 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
  post.user_id 1
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
