require 'rails_helper'

RSpec.describe "Fanalerts", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/fanalert/index"
      expect(response).to have_http_status(:success)
    end
  end

end
