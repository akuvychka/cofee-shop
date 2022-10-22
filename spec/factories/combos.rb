FactoryBot.define do
  factory :combo do
    name { FFaker::Lorem.word }
    active { true }
  end
end
