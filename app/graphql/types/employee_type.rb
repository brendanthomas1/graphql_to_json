module Types
  class EmployeeType < Types::BaseObject
    description 'a person'

    field :first_name, String, null: false
    field :last_name, String, null: false
    field :gender, String, null: false
    field :seniority, String, null: false
    field :job, JobType, null: false
  end
end
