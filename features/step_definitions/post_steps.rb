Given /^no posts exist for "([^"]*)"$/ do |cluster_name|
  cluster = Cluster.find_by_name(cluster_name)
  cluster.posts.each do |p|
    p.destroy
  end
end

Given /^the following posts for "([^"]*)":$/ do |cluster_name, posts_table|
  # already setup via clusters given - Given "I have one user \"another@user.org\" with password \"passpasswordword\""
  
  cluster = Cluster.find_by_name(cluster_name)
  posts_table.hashes.each do |hash|
    post = @current_user.posts.build(hash)
    post.cluster = cluster
    post.save!
  end
end

When /^I create a URL post$/ do
  fill_in "Title", :with => "How the FBI raided Anonymous"
  fill_in "Description", :with => "The FBI yesterday executed 40 search warrants around the US to gather evidence on the Anonymous distributed denial of service (DDoS) attacks in defense of WikiLeaks last year attacks which targeted Visa, MasterCard, PayPal, and Amazon."
  fill_in "URL", :with => "http://arstechnica.com/tech-policy/news/2011/01/two-real-guns-pointed-at-me-how-the-fbi-raided-anonymous.ars"
  click_button "Create post"
end

When /^I create a post without all the requirements$/ do
  click_button "Create post"
end