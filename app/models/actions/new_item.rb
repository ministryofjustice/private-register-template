# encapsulates the logic required to record a
# new item in the DB.
# Removes the need for before_xyz callbacks in the model.
#
class NewItem
  def perform(opts = {})
    item = Item.new(opts)
    Entry.record!(item)
    item.save!
  end
end