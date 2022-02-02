require "rails_helper"

RSpec.describe MooTasksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/moo_tasks").to route_to("moo_tasks#index")
    end

    it "routes to #new" do
      expect(get: "/moo_tasks/new").to route_to("moo_tasks#new")
    end

    it "routes to #show" do
      expect(get: "/moo_tasks/1").to route_to("moo_tasks#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/moo_tasks/1/edit").to route_to("moo_tasks#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/moo_tasks").to route_to("moo_tasks#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/moo_tasks/1").to route_to("moo_tasks#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/moo_tasks/1").to route_to("moo_tasks#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/moo_tasks/1").to route_to("moo_tasks#destroy", id: "1")
    end
  end
end
