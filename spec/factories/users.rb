FactoryBot.define do
  factory :user do
    sequence(:username) {|n| "Name#{n}"}
    sequence(:email) {|n| "#{n}@email.com"}
    sequence(:password) {|n| "password#{n}"}
    sequence(:first_name) {|n| "first_name#{n}"}
    sequence(:last_name) {|n| "last_name#{n}"}
    sequence(:street) {|n| "street#{n}"}
    sequence(:city) {|n| "city#{n}"}
    sequence(:state) {|n| "state#{n}"}
    sequence(:zipcode) {|n| "zipcode#{n}"}
  end
end
