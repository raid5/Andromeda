require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    
    User.create!(:email => "mcdonald.adam@gmail.com",
                 :password => "bigmac",
                 :password_confirmation => "bigmac")
                 
    User.create!(:email => "dhoang2@gmail.com",
                 :password => "password",
                 :password_confirmation => "password")
                 
    98.times do |n|
      email = "example-#{n+1}@bigmac.org"
      password  = "password"
      User.create!(:email => email,
                   :password => password,
                   :password_confirmation => password)
    end
    
    User.all(:limit => 10).each do |user|
      3.times do
        user.clusters.create!(:name => Faker::Lorem.words(3).join(' '), :description => Faker::Lorem.sentence(5))
      end
    end
  end
end
