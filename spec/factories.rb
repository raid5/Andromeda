Factory.define :user do |user|
  user.email                 "bigmac@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.define :cluster do |cluster|
  cluster.name        "A cluster"
  cluster.description "My sweet cluster of awesome"
  cluster.association :user
end