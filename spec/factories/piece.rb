FactoryBot.define do
  factory :piece do
    association :game
    color :white
    x 1
    y 1

    factory :king do
      type :king
      x 4
      y 1
    end
  end
end
