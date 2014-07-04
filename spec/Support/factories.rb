FactoryGirl.define do
  factory :book do
    sequence(:title) { |n| 'Obligatory book#{}' }
    author 'Some name'
    year 2000
    description 'This is to test the functionality of description.'
    category 'Ridiculous'
  end

  factory :review do
    rating 4
    body 'Comment'
  end
end
