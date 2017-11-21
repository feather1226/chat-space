FactoryGirl.define do
  require 'faker'
    factory :group do
    name {Faker::Team.name}
  end
 end
