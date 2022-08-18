class Micropost < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :content, presence: true,
            length: {maximum: Settings.validations.micropost.content_max_length}
  validates :image, content_type: {in: Settings.micropost.image_type,
                                   message: :wrong_format},
            size: {less_than: Settings.micropost.image_size.megabytes,
                   message: :too_big}
  def display_image
    image.variant resize_to_limit: Settings.micropost.resize_to_limit
  end
end