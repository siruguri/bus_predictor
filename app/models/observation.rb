class Observation
  include Mongoid::Document
  include Mongoid::Extensions::Time

  field :observation_id, type: String
  field :observed_at, type: DateTime
  field :arrives_at, type: DateTime

  field :stop_id, type: Integer
  field :route_id, type: String
  field :gap, type: Integer
end
