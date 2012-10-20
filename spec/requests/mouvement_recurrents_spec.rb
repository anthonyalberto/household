require 'spec_helper'

describe "MouvementRecurrents" do
  describe "GET /mouvement_recurrents" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get mouvement_recurrents_path
      response.status.should be(200)
    end
  end
end
