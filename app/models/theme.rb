class Theme < ApplicationRecord
    has_many :progress

    belongs_to :work

    after_create do
        ActionCable.server.broadcast("works_#{self.work_id}", theme: self, method: 'create')
    end

    after_update do
        ActionCable.server.broadcast("works_#{self.work_id}", theme: self, method: 'update')
    end

    after_destroy do
        ActionCable.server.broadcast("works_#{self.work_id}", theme: self, method: 'destroy')
    end
end
