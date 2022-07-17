class Theme < ApplicationRecord
    has_many :progress, dependent: :destroy

    belongs_to :work
end
