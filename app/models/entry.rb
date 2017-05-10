class Entry
  include Mongoid::Document
  field :entry_number, type: String
  field :entry_timestamp, type: String
  field :item_hash, type: String
  field :key, type: String
end
