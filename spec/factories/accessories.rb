FactoryBot.define do
  factory :accessory do
    sequence(:name) { |n| "name#{n}" }
    sequence(:description) { |n| "description#{n}"}
    sequence(:price) { |n| 100 + n}
    image_path('bike.png')
  end
end
