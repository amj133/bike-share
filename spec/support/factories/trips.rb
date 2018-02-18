FactoryBot.define do
  factory :trip do
    sequence(:duration) { |n| "Duration#{n}"}
    sequence(:start_date) { |n| "start_date#{n}"}
    sequence(:start_station) { |n| "start_station#{n}"}
    sequence(:end_date) { |n| "end_date#{n}"}
    sequence(:end_station) { |n| "end_station#{n}"}
    sequence(:bike_id) { |n| "bike_id#{n}"}
    sequence(:subscription) { |n| "subscription#{n}"}
    sequence(:zipcode) { |n| "Zipcode#{n}"}
  end
end
