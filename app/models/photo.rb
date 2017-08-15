class Photo < ApplicationRecord
  belongs_to :imageable, polymorphic: true, optional: true

  has_attached_file :image, styles: { large:"500X500>", medium: "300x300>", thumb: "100x100>", small: "50x50>" }, default_url: "/images/missing.png"

  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/svg']

  validates_presence_of :image
end
