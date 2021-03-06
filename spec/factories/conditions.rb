FactoryBot.define do
  factory :condition do
    sequence(:date) { |n| DateTime.new(2001, 9, n) }
    sequence(:max_temp_f) { |n| n.to_f}
    sequence(:mean_temp_f) { |n| n.to_f}
    sequence(:min_temp_f) { |n| n.to_f}
    sequence(:mean_visibility_miles) { |n| n.to_f}
    sequence(:mean_humidity) { |n| n.to_f}
    sequence(:mean_wind_speed) { |n| n.to_f}
    sequence(:precipitation_inches) { |n| n.to_f}
  end
end
  
