class Task < ApplicationRecord
  belongs_to :user
  enum status: [:backlog, :in_progress, :done], _default: :in_progress
end
