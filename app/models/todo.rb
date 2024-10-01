class Todo < ApplicationRecord
  belongs_to :todoable, polymorphic: true
end
