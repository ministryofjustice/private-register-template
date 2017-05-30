require 'rails_helper'

class MyTestClass < Item
  attr_accessor :key
end


describe Actions::NewItem do
  let(:args){ {class: MyTestClass} }

  describe '#perform!' do
    it 'returns an item' do
      expect(subject.class.perform!(args)).to be_a(Item)
    end

    describe 'the returned item' do
      let(:the_item){ subject.class.perform!(args) }

      it 'is persisted' do
        expect(the_item.persisted?).to eq(true)
      end

      it 'has a corresponding Entry' do
        expect(Entry.where(item_hashes: the_item.item_hash).count).to eq(1)
      end
    end

  end
end