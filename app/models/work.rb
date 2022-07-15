class Work < ApplicationRecord
    has_many :participants
    has_many :themes
    has_many :progress
    has_many :feelings
    has_many :feeling_records
    has_many :theme_records

    belongs_to :user
end
