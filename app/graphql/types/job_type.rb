module Types
  class JobType < Types::BaseObject
    description 'a job'

    field :title, String, null: false
    field :education_level, String, null: false
  end
end
