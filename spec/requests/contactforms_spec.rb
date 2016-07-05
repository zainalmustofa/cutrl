require 'rails_helper'

RSpec.describe "Contactforms", type: :request do
  describe "GET /contactforms" do
    it "works! (now write some real specs)" do
      get contactforms_path
      expect(response).to have_http_status(200)
    end
  end
end
