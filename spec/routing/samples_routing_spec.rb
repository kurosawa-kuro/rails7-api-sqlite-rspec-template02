require "rails_helper"

RSpec.describe SamplesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/samples").to route_to("samples#index")
    end

    it "routes to #create" do
      expect(post: "/samples").to route_to("samples#create")
    end
  end
end
