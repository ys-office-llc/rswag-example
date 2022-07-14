class Todo < ApplicationRecord
  validates :name, presence: true
  validates :done, inclusion: { in: [true, false] }
end
