require 'rails_helper'

RSpec.describe "Teas", type: :request do
  describe "GET /teas" do
    it "works! (now write some real specs)" do
      get teas_path
      expect(response).to have_http_status(200)
    end
  end
end
