require 'spec_helper'

describe "TypeDeMouvements" do
  describe "GET /type_de_mouvements" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get type_de_mouvements_path
      response.status.should be(200)
    end
  end
end
