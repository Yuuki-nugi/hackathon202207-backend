class Work < ApplicationRecord
    has_many :participants, dependent: :destroy
    has_many :themes, dependent: :destroy
    has_many :progresses, dependent: :destroy
    has_many :feelings, dependent: :destroy
    has_many :feeling_records, dependent: :destroy

    belongs_to :user
end
