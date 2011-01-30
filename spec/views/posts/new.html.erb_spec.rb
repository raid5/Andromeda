require 'spec_helper'

describe "posts/new.html.erb" do
  let(:cluster) { mock_model("Cluster").as_null_object }
  let(:post) { mock_model("Post").as_new_record.as_null_object }
  
  before do
    assign(:cluster, cluster)
    assign(:post, post)
  end
  
  it "renders a form to create a post" do
    render
    rendered.should have_selector("form",
      :method => "post",
      :action => cluster_posts_path(cluster)
    ) do |form|
      form.should have_selector("input", :type => "submit")
    end
  end
  
  it "renders a text field for the post URL" do
    url = "http://github.com"
    post.stub(:url => url)
    render
    rendered.should have_selector("form") do |form|
      form.should have_selector("input",
        :type => "text", 
        :name => "post[url]", 
        :value => url
      )
    end
  end
  
  it "renders a text field for the post title" do
    title = "the title"
    post.stub(:title => title)
    render
    rendered.should have_selector("form") do |form|
      form.should have_selector("input",
        :type => "text", 
        :name => "post[title]", 
        :value => title
      )
    end
  end
  
  it "renders a text area for the post description" do
    desc = "description. " * 20
    post.stub(:description => desc)
    render
    rendered.should have_selector("form") do |form|
      form.should have_selector("textarea",
        :name => "post[description]",
        :content => desc
      )
    end
  end
end