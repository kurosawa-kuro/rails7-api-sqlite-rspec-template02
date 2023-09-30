require 'rails_helper'

RSpec.describe "/samples", type: :request do
  let(:valid_attributes) { { title: "Valid Sample Title" } }
  let(:invalid_attributes) { { title: "" } }
  let(:valid_headers) { {} }

  describe "GET /index" do
    let!(:sample) { Sample.create! valid_attributes }

    before { get samples_url, headers: valid_headers, as: :json }

    it "renders a successful response" do
      print_response_details

      expect(response).to be_successful
      expect(response.parsed_body.first["title"]).to eq(sample.title)
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      before { post samples_url, params: { sample: valid_attributes }, headers: valid_headers, as: :json }

      it "creates a new Sample" do
        expect(Sample.last.title).to eq("Valid Sample Title")
      end

      it "renders a JSON response with the new sample" do
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
        expect(response.parsed_body["title"]).to eq("Valid Sample Title")
      end
    end

    context "with invalid parameters" do
      before { post samples_url, params: { sample: invalid_attributes }, headers: valid_headers, as: :json }

      it "does not create a new Sample" do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "renders a JSON response with errors for the new sample" do
        expect(response.content_type).to match(a_string_including("application/json"))
        expect(response.parsed_body["title"]).to include("can't be blank")
      end
    end
  end
end
