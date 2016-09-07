class Observation
  include Mongoid::Document
  include Mongoid::Extensions::Time
  include Mongoid::Indexable

  field :observation_id, type: String
  field :observed_at, type: Time
  index({observed_at: 1})
  
  field :arrives_at, type: Time  
  field :arrives_at_hour, type: Integer
  field :arrives_at_minute, type: Integer
  index({arrives_at_hour: 1, arrives_at_minute: 1})
          
  field :stop_id, type: Integer
  field :route_id, type: String

  index({stop_id: 1, route_id: 1})
  field :gap, type: Integer

  after_initialize :set_hour_minute

  private
  def set_hour_minute
    unless self.arrives_at.nil?
      self.arrives_at_minute = self.arrives_at.min
      self.arrives_at_hour = self.arrives_at.hour
    end
  end    
end
