Fabricator(:url) do
  full_url { Faker::Internet.url }
  path { Faker::Lorem.characters(2) }
  times_visited { Faker::Number.number(3) }
end
