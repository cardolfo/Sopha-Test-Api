class Store < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  belongs_to :user

  def as_json
    Jbuilder.new do |store|
      store.id id
      store.name name
    end
  end
end
