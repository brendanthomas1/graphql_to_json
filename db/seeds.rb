Zoo.find_or_create_by(name: 'Cleveland Metroparks Zoo')

(1..10).each do |_i|
  AnimalType.find_or_create_by(name: Faker::Creature::Animal.name)
end

(1..15).each do |_i|
  Animal.create name: Faker::Name.first_name,
                gender: Faker::Gender.short_binary_type,
                age: rand(1..20),
                animal_type_id: AnimalType.order('RANDOM()').first.id,
                zoo_id: Zoo.first.id,
                weight: rand(10..800)
end

(1..10).each do |_i|
  Job.find_or_create_by title: Faker::Job.title, education_level: Faker::Job.education_level
end

(1..10).each do |_i|
  Employee.create first_name: Faker::Name.first_name ,
                  last_name: Faker::Name.last_name,
                  gender: Faker::Gender.short_binary_type,
                  seniority: Faker::Job.seniority,
                  zoo_id: Zoo.first.id,
                  job_id: Job.order('RANDOM()').first.id
end
