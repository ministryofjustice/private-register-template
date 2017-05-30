require 'rails_helper'

describe Concerns::Hashable do
  context 'included in a class' do
    let(:including_class){ Item }

    it 'adds an item_hash field' do
      expect(including_class.fields['item_hash']).to_not be_nil
    end
  end

  describe 'an instance of an including class' do
    let(:instance){ Item.new }

    context 'with a hash that already exists' do
      let(:existing_item){ Item.new(item_hash:'foobar') }
      before do
        existing_item.save!
        instance.item_hash = 'foobar'
      end
      after do
        existing_item.delete
      end

      it 'does not save' do
        expect { instance.save! }.to raise_error(Mongoid::Errors::Validations)
      end

      it 'gets a validation error on item_hash' do
        instance.valid?
        expect(instance.errors[:item_hash]).to_not be_empty
      end
    end
  end
end