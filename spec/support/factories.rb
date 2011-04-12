Factory.define :user do |user|
  user.id 1
  user.email Faker::Internet.email
  user.password "password"
  user.password_confirmation "passoword"
end

Factory.define :post do |post|
  post.id 1
  post.title 'Lorem ipsum'
  post.body 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
  post.user_id 1
end

Factory.define :page do |page|
  page.id 1
  page.name 'Lorem ipsum'
  page.body 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
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

Factory.define :private_snippet do |sni|
  sni.id 1
  sni.content "private lorem"
  sni.private 1
  sni.public_sha '999999999999'
  sni.language_id 1
  sni.user_id 1
end
