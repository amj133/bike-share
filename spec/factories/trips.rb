FactoryBot.define do
  factory :trip do
    sequence(:duration) { |n| n}
    start_date(DateTime.new(2001, 9, 11))
    end_date(DateTime.new(2001, 9, 12))
    sequence(:bike_id) { |n| n}
    sequence(:subscription) { |n| "subscription#{n}"}
    sequence(:zipcode) { |n| n}
    start_station_id(1)
    end_station_id(2)
  end
end
