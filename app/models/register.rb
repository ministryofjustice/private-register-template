# Represents this Register itself
class Register
  attr_accessor :steward, :description, :phase, :name, :key

  def this_register
    Rails.configuration.x.this_register
  end

  def to_h
    {
      fields: Record.field_names.to_a,
      steward: steward,
      text: description,
      phase: phase,
      register: name,
      key: key
    }
  end

  def self.meta_data
    {
      total_records: Record.count,
      total_entries: Entry.count,
      register_record: this_register.to_h,
      last_updated: timestamp
    }
  end
end