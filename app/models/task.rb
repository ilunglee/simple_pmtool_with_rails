class Task < ActiveRecord::Base
  validate :title, uniquness: true, presence: { message: "must have title" }
end
