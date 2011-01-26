When /^I create a cluster$/ do
  visit clusters_path
  click_link "Add Cluster"
  fill_in "Name", :with => "A cluster"
  fill_in "Description", :with => "My cluster description"
  click_button "Create cluster"
end

When /^I create a cluster without all the requirements$/ do
  visit clusters_path
  click_link "Add Cluster"
  click_button "Create cluster"
end

Given /^I have the following clusters:$/ do |clusters_table|
  clusters_table.hashes.each do |hash|
    @current_user.clusters.create!(hash)
  end
end

Given /^the following clusters:$/ do |cluster_table|
  Given "I have one user \"another@user.org\" with password \"passpasswordword\""
  Given "I have the following clusters:", cluster_table
end

Given /^I have no clusters$/ do
  @current_user.clusters.each do |cluster|
    cluster.destroy
  end
end

When /^I view all clusters$/ do
  visit browse_clusters_path
end

When /^I view my clusters$/ do
  visit clusters_path
end
