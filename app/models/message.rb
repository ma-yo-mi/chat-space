class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :options, :group_id, :user_id, presence: true
  mount_uploader :image, ImageUploader


private
  def options
    body.presence or image.presence
  end
end
