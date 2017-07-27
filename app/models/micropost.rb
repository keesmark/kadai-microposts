class Micropost < ApplicationRecord
  belongs_to :user
  has_many :favarites, dependent: :destroy
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  
  def favarited_by? user
    favarites.where(user_id: user.id).exists?
  end
end
