require 'spec_helper'

describe "clusters/browse.html.erb" do
  let(:clusters) do
    [
      mock_model("Cluster", :name => 'cluster 1 name').as_null_object,
      mock_model("Cluster", :name => 'cluster 2 name').as_null_object
    ]
  end

  before do
    assign(:clusters, clusters)
  end

  it "renders a list of links to clusters" do
    render
    rendered.should have_selector("ul") do |list|
      list.should have_selector("li") do |li|
        li.should have_selector("a", :href => cluster_path(clusters[0]), :content => "cluster 1 name")
      end
      list.should have_selector("li") do |li|
        li.should have_selector("a", :href => cluster_path(clusters[1]), :content => "cluster 2 name")
      end
    end
  end
end