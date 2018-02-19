FactoryBot.define do
  factory :station do
    sequence(:name) {|n| "Name#{n}"}
    sequence(:lat) {|n| "lat#{n}"}
    sequence(:long) {|n| "long#{n}"}
    sequence(:dock_count) {|n| "dock_count#{n}"}
    sequence(:city) {|n| "City#{n}"}
    installation_date(DateTime.now)
  end
end
