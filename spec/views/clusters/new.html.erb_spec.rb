require 'spec_helper'

describe "clusters/new.html.erb" do
  let(:cluster) do
    mock_model("Cluster").as_new_record.as_null_object
  end
  
  before do
    assign(:cluster, cluster)
  end
  
  it "renders a form to create a cluster" do
    render
    rendered.should have_selector("form",
      :method => "post",
      :action => clusters_path
    ) do |form|
      form.should have_selector("input", :type => "submit")
    end
  end
  
  it "renders a text field for the cluster name" do
    cluster.stub(:name => "the name")
    render
    rendered.should have_selector("form") do |form|
      form.should have_selector("input",
        :type => "text", 
        :name => "cluster[name]", 
        :value => "the name"
      )
    end
  end
  
  it "renders a text area for the cluster description" do
    desc = "description. " * 20
    cluster.stub(:description => desc)
    render
    rendered.should have_selector("form") do |form|
      form.should have_selector("textarea",
        :name => "cluster[description]",
        :content => desc
      )
    end
  end
end