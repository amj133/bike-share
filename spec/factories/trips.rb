FactoryBot.define do
  factory :trip do
    sequence(:duration) { |n| "Duration#{n}"}
    start_date(DateTime.now)
    end_date(DateTime.now)
    sequence(:bike_id) { |n| "bike_id#{n}"}
    sequence(:subscription) { |n| "subscription#{n}"}
    sequence(:zipcode) { |n| "Zipcode#{n}"}
    start_station_id(1)
    end_station_id(2)
  end
end
