Observation.all.map do |o|
  # After_initialize shd take care of the required changes
  o.save
end
