FactoryBot.define do
  factory :trip do
    sequence(:duration) { |n| n}
    start_date(DateTime.now)
    end_date(DateTime.now)
    sequence(:bike_id) { |n| n}
    sequence(:subscription) { |n| "subscription#{n}"}
    sequence(:zipcode) { |n| n}
    start_station_id(1)
    end_station_id(2)
  end
end
