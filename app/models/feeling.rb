class Feeling < ApplicationRecord
    belongs_to :user
    belongs_to :work

    validates :degree, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: -3, less_than_or_equal_to: 3}
end
