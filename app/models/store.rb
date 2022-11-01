class Store < ApplicationRecord

    def as_json
        Jbuilder.new do |store|
            store.id id
            store.name name
        end
    end
end
