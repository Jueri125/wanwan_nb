class Review < ApplicationRecord
  has_one_attached :image
  has_many :comments, dependent: :destroy
  belongs_to :prefecture


  enum review_type: { dog_run: 0, dog_cafe: 1, dog_hotel: 2, dog_event: 3 }
end
