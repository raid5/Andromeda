When /^I create a cluster "([^"]*)"$/ do |name|
  visit clusters_path
  click_link "Add Cluster"
  fill_in "Name", :with => name
  click_button "Create cluster"
end

When /^I create a cluster without all the requirements$/ do
  visit clusters_path
  click_link "Add Cluster"
  click_button "Create cluster"
end
