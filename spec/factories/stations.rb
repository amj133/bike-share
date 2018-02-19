FactoryBot.define do
  factory :station do
    sequence(:name) {|n| "Name#{n}"}
    sequence(:lat) {|n| n}
    sequence(:long) {|n| n}
    sequence(:dock_count) {|n| n}
    sequence(:city) {|n| "City#{n}"}
    installation_date(DateTime.now)
  end
end
