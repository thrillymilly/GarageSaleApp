class LostPet < ActiveRecord::Base
has_many :comments

validates :pet_name, presence: true

end
