class Employee < ApplicationRecord
  belongs_to :zoo
  belongs_to :job
end
