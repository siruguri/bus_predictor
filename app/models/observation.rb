class Observation
  include Mongoid::Document
  include Mongoid::Extensions::Time

  field :observation_id, type: String
  field :observed_at, type: Time
  field :arrives_at, type: Time

  field :stop_id, type: Integer
  field :route_id, type: String
  field :gap, type: Integer
end
