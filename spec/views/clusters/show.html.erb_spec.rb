require 'spec_helper'

describe "clusters/show.html.erb" do
  let(:cluster) {
    mock_model("Cluster", :name => 'cluster 1 name',
                          :description => "a sweet cluster in fact").as_null_object
  }

  before do
    assign(:cluster, cluster)
    assign(:posts, [])
  end

  it "renders the cluster details" do
    render
    rendered.should have_selector("h1", :content => "cluster 1 name")
    rendered.should have_selector("p",  :content => "a sweet cluster in fact")
  end
  
  it "displays a link to add a new post" do
    render
    rendered.should have_selector("a",
                                  :href => new_cluster_post_path(cluster),
                                  :content => "Add Post")
  end
  
  context "with existing posts" do
    let(:posts) do
      [
        mock_model("Post", :url => 'http://example.com', :title => 'post title 1').as_null_object,
        mock_model("Post", :url => 'http://example.org', :title => 'post title 2').as_null_object
      ]
    end

    before do
      assign(:posts, posts)
    end

    it "renders a list of posts" do
      render
      rendered.should have_selector("ul") do |list|
        list.should have_selector("li", :content => "post title 1")
        list.should have_selector("li", :content => "post title 2")
      end
    end
  end
  
  context "with no posts" do
    let(:posts) { [] }

    before do
      assign(:posts, posts)
    end

    it "renders a no posts message" do
      render
      rendered.should have_selector("p", :content => "No posts.")
    end
  end
end