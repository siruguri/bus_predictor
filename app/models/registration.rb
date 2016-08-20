class Registration
  include GlobalID::Identification
  include Mongoid::Document
  
  field :intersection_id, type: String
  field :route_ids, type: Array
  field :stop_ids, type: Array

  field :is_on, type: Boolean

  belongs_to :intersection
end
