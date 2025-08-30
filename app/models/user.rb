class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  def avatar_url
    if avatar.attached?
      Rails.application.routes.url_helpers.rails_blob_path(avatar, only_path: true)
    else
      nil
    end
  end
end
