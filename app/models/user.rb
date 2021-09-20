class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
      validates :nickname
      validates :birth_date
    with_options format: {with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/, message: "is invalid. Input half-width alphanumeric."} do
      validates :encrypted_password
      validates :password
      validates :password_confirmation
    end
    with_options format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."} do
      validates :last_name
      validates :first_name
    end
    with_options format: {with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."} do
      validates :last_name_kana
      validates :first_name_kana
    end
  end
  # has_many :items,          foreign_key: :user_id, dependent: :destroy
  # has_many :purchases,      foreign_key: :user_id, dependent: :destroy
end
