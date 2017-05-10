class Item
  include Mongoid::Document
  include Mongoid::Slug

  field :item_hash, type: String
  slug :item_hash
end
