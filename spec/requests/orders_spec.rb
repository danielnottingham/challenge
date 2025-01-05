require 'rails_helper'

RSpec.describe OrdersController, type: :request do
  describe "GET #index" do
    it "requires authentication" do
      get orders_path

      expect(response).to be_authenticated
    end
  end

  describe "GET #new" do
    it "requires authentication" do
      get new_order_path

      expect(response).to be_authenticated
    end
  end

  describe "POST #create" do
    it "requires authentication" do
      post orders_path

      expect(response).to be_authenticated
    end
  end
end
