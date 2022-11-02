class Store < ApplicationRecord

    validates :name, presence: true

    def as_json
        Jbuilder.new do |store|
            store.id id
            store.name name
        end
    end
end
