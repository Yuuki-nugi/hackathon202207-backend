class Work < ApplicationRecord
    has_many :participants
    has_many :themes
    has_many :progresses
    has_many :feelings
    has_many :feeling_records

    belongs_to :user
end
