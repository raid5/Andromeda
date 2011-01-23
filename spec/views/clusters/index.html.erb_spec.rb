require 'spec_helper'

describe "clusters/index.html.erb" do
  it "displays a link to add a new cluster" do
    render
    rendered.should have_selector("a",
                                  :href => new_cluster_path,
                                  :content => "Add Cluster")
  end
end