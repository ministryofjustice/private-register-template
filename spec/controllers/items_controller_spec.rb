require 'rails_helper'

describe ItemsController, type: :controller do
  let(:existing_item){ Item.create! }

  describe 'GET show' do
    context 'given an item_hash' do
      let(:item_hash){ existing_item.item_hash }

      describe 'a json request' do
        let(:format){ 'json' }
        
        describe 'the response' do
          before do
            get :show, item_hash: item_hash, format: format
          end
          let(:response_data){ JSON.parse(response.body) }
          let(:expected_attributes){ existing_item.attributes.except('_id') }

          it 'has status 200' do
            expect(response.status).to eq(200)
          end

          it 'is json' do
            expect(response.content_type).to eq('application/json')
          end

          it 'includes all the item attributes except _id' do
            expected_attributes.each do |key, value|
              expect(response_data[key]).to eq(value)
            end
          end

          it 'does not include additional attributes' do
            expect(response_data.keys.sort).to eq(expected_attributes.keys.sort)
          end
        end
      end
    end
  end
end
