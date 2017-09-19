class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :options, presence: true
  mount_uploader :image, ImageUploader

private
  def options
    body.presence or image.presence
  end
  # TODO: 画像実装した際に再確認要
end
