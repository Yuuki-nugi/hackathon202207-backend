class Progress < ApplicationRecord
    belongs_to :work
    belongs_to :theme, optional: true
end
