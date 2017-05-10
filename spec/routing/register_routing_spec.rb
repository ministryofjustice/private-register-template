require 'rails_helper'

# see https://openregister.github.io/specification/
describe 'OpenRegister standard routes', type: :routing do
  # https://openregister.github.io/specification/#entity-resources
  describe 'entity resources' do
    it 'routes an item by hash' do
      expect(get: '/item/sha:1234567890').to be_routable
    end
    it 'routes an entry by primary key' do
      expect(get: '/entry/1234').to be_routable
    end
    it 'routes a record by item primary key' do
      expect(get: '/record/1234').to be_routable
    end
    it 'routes the register metadata' do
      expect(get: '/register').to be_routable
    end
  end

  describe 'proof routes' do
    it 'routes the register proof by proof-identifier' do
      expect(get: '/proof/register/merkle:sha-256').to be_routable
    end
    it 'routes proof for any entry by proof-identifier' do
      expect(get: '/proof/entry/123/1234/merkle:sha-256').to be_routable
    end
    it 'routes proof of consistency for the whole register by 2 entry numbers and proof-identifier' do
      expect(get: '/proof/consistency/123/124/merkle:sha-256').to be_routable
    end
    it 'routes proof of integrity for all the records in the register by proof-identifier' do
      expect(get: '/proof/records/merkle:sha-256').to be_routable
    end
    it 'routes proof that an entry is the latest entry for a record by total entries, item primary key and proof-identifier' do
      expect(get: '/proof/record/1234/ABC1234/merkle:sha-256').to be_routable
    end
  end

  describe 'collection routes' do
    it 'routes items' do
      expect(get: '/items').to be_routable
    end
    it 'routes entries' do
      expect(get: '/entries').to be_routable
    end
    it 'routes entries for an item by item-hash' do
      expect(get: '/item/sha-256:123456789/entries').to be_routable
    end
    it 'routes entries for a record' do 
      expect(get: '/record/ABC123456789/entries').to be_routable
    end
    it 'routes records' do
      expect(get: '/records').to be_routable
    end
    it 'routes records matching a field-name and field-value' do
      expect(get: '/records/name/john+smith').to be_routable
    end
    it 'routes proofs' do
      expect(get: '/proofs').to be_routable
    end
    it 'routes proof for an entry by entry number' do
      expect(get: '/entry/1234/proofs').to be_routable
    end
  end

  it 'conforms to the standard for archive routes' do
    expect(get: '/download-register').to be_routable
  end
end