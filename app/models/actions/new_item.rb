
module Actions
  # encapsulates the logic required to record a
  # new item in the DB.
  # Removes the need for before_xyz callbacks in the model.
  #
  class NewItem
    def self.perform(opts = {})
      klass = opts.delete(:class) || Item
      item = klass.new(opts)
      item.save!
      Entry.record!(item)
      item
    end
  end
end
