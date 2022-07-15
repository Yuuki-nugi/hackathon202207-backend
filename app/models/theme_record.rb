class ThemeRecord < ApplicationRecord
    belongs_to :theme
    belongs_to :work
end
