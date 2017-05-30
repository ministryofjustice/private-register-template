require 'autoinc'

# essentially an audit trail of which items were added when
# TODO: ...add who stored it?
class Entry
  include Mongoid::Document
  include Mongoid::Autoinc

  field :entry_number, type: String
  increments :entry_number

  field :entry_timestamp, type: String
  field :item_hashes, type: String
  field :key, type: String

  has_many :items

  before_create do |_document|
    self.entry_timestamp = Time.now
  end

  # NOTE: the API reference shows item_hash can be an array, as
  # "an entry may have multiple items"
  # But in that case, shouldn't the key be an array as well?
  # I've asked about this, not got an answer yet.
  def self.record!(for_item)
    self.item_hashes = [for_item.item_hash]
    self.key = for_item.key
  end
end
