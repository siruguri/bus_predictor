class Observation
  include Mongoid::Document
  include Mongoid::Extensions::Time

  field :observation_id, type: String
  field :observed_at, type: DateTime
  field :arrival_guesses, type: Array # of {route_id:, arrives_at:, guess_gap:} hashes
end
