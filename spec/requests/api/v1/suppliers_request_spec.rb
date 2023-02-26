require 'rails_helper'

RSpec.describe Api::V1::SuppliersController do
  describe 'GET #index' do
    let!(:suppliers) { create_list(:supplier, 3) }

    subject!(:get_index) { get api_v1_suppliers_path }

    it { expect(response).to have_http_status :ok }
    it { expect(body_json['data'].count).to eq 3 }
  end

  describe 'GET #show' do
    let!(:supplier) { create(:supplier) }

    subject!(:get_show) { get api_v1_suppliers_path(supplier.id) }

    it { expect(response).to have_http_status :ok }
    it { expect(body_json['data'][0]['id']).to eq supplier.id }
  end

  describe 'POST #create' do
    subject(:post_create) { post api_v1_suppliers_path, params: { supplier: form_params} }

    let(:form_params) { attributes_for(:supplier) }

    it do
      expect{ post_create }.to change(Supplier, :count).by(1)
    end

    context 'with wrong params' do
      let(:form_params) { { nit: ''} }
      let(:error_messege) { {"name"=>["can't be blank"], "nit"=>["can't be blank"]} }

      it do
        expect{ post_create }.to change(Supplier, :count).by(0)
      end

      it do
        post_create

        expect(body_json['errors']).to eq error_messege
      end
    end
  end

  describe 'PUT #update' do
    subject(:put_update) { put api_v1_supplier_path(supplier.id), params: { supplier: form_params} }

    let!(:supplier) { create(:supplier) }
    let(:form_params) { attributes_for(:supplier) }

    it do
      put_update

      expect(response).to have_http_status :ok
    end

    context 'with wrong params' do
      let(:form_params) { { nit: nil } }
      let(:error_messege) { {"nit"=>["can't be blank"]} }

      it do 
        put_update

        expect(response).to have_http_status :unprocessable_entity
      end

      it do 
        put_update

        expect(body_json['errors']).to eq error_messege 
      end
    end
  end

  describe 'DELETE #destroy' do
    subject(:delete_destroy) { delete api_v1_supplier_path(supplier.id) }

    let!(:supplier) { create(:supplier) }

    it do 
      delete_destroy

      expect(response).to have_http_status :ok
    end
  end
end