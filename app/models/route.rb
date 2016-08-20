class Route
  include Mongoid::Document
  field :name, type: String
  field :authority, type: String
  field :authority_id, type: String 
end
