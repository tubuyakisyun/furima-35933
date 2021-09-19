class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birth_date, presence: true
  validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
  validates :last_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana"}
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana"}

  has_many :items,          foreign_key: :user_id, dependent: :destroy
  has_many :purchases,      foreign_key: :user_id, dependent: :destroy
end
