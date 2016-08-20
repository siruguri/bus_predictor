class Intersection
  include Mongoid::Document
  field :name, type: String
  field :geolocation, type: Array
end
