require 'spec_helper'

describe "clusters/show.html.erb" do
  let(:cluster) {
    mock_model("Cluster", :name => 'cluster 1 name',
                          :description => "a sweet cluster in fact").as_null_object
  }

  before do
    assign(:cluster, cluster)
  end

  it "renders the cluster details" do
    render
    rendered.should have_selector("h1", :content => "cluster 1 name")
    rendered.should have_selector("p",  :content => "a sweet cluster in fact")
  end
end