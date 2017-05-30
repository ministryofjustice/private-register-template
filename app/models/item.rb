# Represents the actual chunk of json data that's stored
class Item
  include Mongoid::Document
  include Concerns::Hashable

  has_one :entry

  before_update do |_document|
    raise NoMethodError,
          'Items cannot be updated or destroyed in an append-only store'
  end
  before_destroy do |_document|
    raise NoMethodError,
          'Items cannot be updated or destroyed in an append-only store'
  end

  # The spec says:
  # "Each register uses an unique identifier, which is a unique field
  # only used in that register. It appears in every entry and always
  # has the same name as the name of the register. It is used to tie
  # entries to records."
  # So items the country register should have a primary-key attribute
  # called 'country', etc.
  # We find it useful to define a transferrable "key" method which aliases
  # the p.k. attribute, so that it can be called from other classes
  # without needing to know what it's called.
  def key
    raise NoMethodError,
          'implement in subclasses'
  end

end
