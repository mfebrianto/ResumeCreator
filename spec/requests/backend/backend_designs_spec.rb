require 'spec_helper'

describe "Backend::Designs" do
  describe "GET /backend_designs" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get backend_designs_path
      response.status.should be(200)
    end
  end
end
