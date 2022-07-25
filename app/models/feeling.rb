class Feeling < ApplicationRecord
    belongs_to :user
    belongs_to :work

    validates :degree, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: -3, less_than_or_equal_to: 3}

    after_commit do
        work = self.work
        sum_feeling = work.feelings.sum(:degree)
        ActionCable.server.broadcast("works_#{self.work_id}", {feeling: sum_feeling})
    end
end
