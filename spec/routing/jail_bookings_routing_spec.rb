require "rails_helper"

RSpec.describe JailBookingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/jail_bookings").to route_to("jail_bookings#index")
    end

    it "routes to #new" do
      expect(get: "/jail_bookings/new").to route_to("jail_bookings#new")
    end

    it "routes to #show" do
      expect(get: "/jail_bookings/1").to route_to("jail_bookings#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/jail_bookings/1/edit").to route_to("jail_bookings#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/jail_bookings").to route_to("jail_bookings#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/jail_bookings/1").to route_to("jail_bookings#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/jail_bookings/1").to route_to("jail_bookings#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/jail_bookings/1").to route_to("jail_bookings#destroy", id: "1")
    end
  end
end
