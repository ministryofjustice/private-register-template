require 'active_support/concern'

module Concerns
  # automatically does the following:
  # 1) records a hash of the embedding class's attributes
  #    (minus the mongo _id) in item_hash
  # 2) ensures that the hash is unique
  #
  # You can provide a class to implement the digest in the config var
  # Rails.configuration.x.hash_type (default is Digest::SHA256)
  module Hashable
    extend ActiveSupport::Concern
    include Mongoid::Document
    
    included do
      include Mongoid::Slug

      field :item_hash, type: String

      before_create { |document| set_hash(:item_hash, document) }
      validates :item_hash, uniqueness: true

      def set_hash(field_name, document)
        send("#{field_name}=", formatted_hash(document)) if send(field_name).nil?
      end

      def formatted_hash(document)
        hash_type = hash_type_or_default
        
        doc_as_json = document.attributes.except('_id').to_h.to_s
        type_specifier = hash_type.to_s.split('::').last.to_s.downcase

        [type_specifier, hash_type.hexdigest(doc_as_json)].join(':')
      end

      def hash_type_or_default
        type = Rails.configuration.x.hash_type
        type.present? ? type : Digest::SHA256
      end
    end
  end
end
