class Theme < ApplicationRecord
    has_many :progress, dependent: :destroy
    has_many :feeling_records, dependent: :destroy

    belongs_to :work
end
