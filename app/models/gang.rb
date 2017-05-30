class Gang < Item
  field :gang, type: String
  field :name, type: String
  field :aliases, type: Array, default: []
  field :grits_id, type: String
  field :identifying_features, type: String
  field :territory, type: String

  before_validation do |document|
    self.gang = name.to_url
  end

  def key
    gang
  end
end
