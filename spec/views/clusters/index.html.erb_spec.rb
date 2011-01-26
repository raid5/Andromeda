require 'spec_helper'

describe "clusters/index.html.erb" do
  it "displays a link to add a new cluster" do
    assign(:clusters, [])
    render
    rendered.should have_selector("a",
                                  :href => new_cluster_path,
                                  :content => "Add Cluster")
  end
  
  context "with existing clusters" do
    let(:clusters) do
      [
        mock_model("Cluster", :name => 'cluster 1 name').as_null_object,
        mock_model("Cluster", :name => 'cluster 2 name').as_null_object
      ]
    end

    before do
      assign(:clusters, clusters)
    end

    it "renders a list of clusters" do
      render
      rendered.should have_selector("ul") do |list|
        list.should have_selector("li", :content => "cluster 1 name")
        list.should have_selector("li", :content => "cluster 2 name")
      end
    end
  end
  
  context "with no clusters" do
    let(:clusters) { [] }

    before do
      assign(:clusters, clusters)
    end

    it "renders a no clusters message" do
      render
      rendered.should have_selector("p", :content => "No clusters.")
    end
  end
end