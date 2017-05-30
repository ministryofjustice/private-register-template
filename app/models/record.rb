# "The set of records is the set of items with highest entry number per-item"
#
class Record
  attr_reader :item

  def self.count
    Item.group(:key).count
  end

  def self.find(key_value)
    item = Item.where(key: key_value).order(entry_number: 'desc').first
    new(item: item)
  end

  def to_h
    h = {}
    h[item.key] = item.entry.to_h
  end
end