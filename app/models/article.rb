class Article < ApplicationRecord

  has_many :comments, dependent: :destroy

  validates :title, presence: true,
                    length: { minimum: 5 }

  mount_uploader :image, ImageUploader

  after_destroy { self.image.remove! }

  # 用来临时存放上传图片时生成的随机文件名
  attr_accessor :image_filename

end
