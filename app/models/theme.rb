class Theme < ApplicationRecord
    has_many :progress
    has_many :feeling_records
    has_many :theme_records

    belongs_to :work
end
