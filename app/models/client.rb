class Client < ApplicationRecord
  has_rich_text :notes

  has_many :projects
  has_many :todos, as: :todoable
end
