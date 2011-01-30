Factory.sequence(:email) {|n| "person#{n}@example.com" }

Factory.define :user do |user|
  #user.email                 "bigmac@example.com"
  user.email                 { Factory.next :email }
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.define :cluster do |cluster|
  cluster.name        "A cluster"
  cluster.description "My sweet cluster of awesome"
  cluster.association :user
end

Factory.define :post do |post|
  post.url         "http://theurl.com"
  post.title       "Nothing Here"
  post.description "A post about nothing."
  post.association :user
  post.association :cluster
end