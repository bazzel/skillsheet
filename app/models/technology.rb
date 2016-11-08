class Technology < ApplicationRecord
  has_and_belongs_to_many :languages, dependent: :destroy
  validates :name, uniqueness: true, presence: true
end
