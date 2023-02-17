class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :items
  # has_many :orders

  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :family_name, presence: true
  validates :first_name_kana, presence: true
  validates :family_name_kana, presence: true
  validates :birth_day, presence: true

  validates :password, presence: true, length: { minimum: 6 }
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  
  validates :family_name,            presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } 
  validates :family_name_kana,       presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } 
  validates :first_name,             presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } 
  validates :first_name_kana,        presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } 

end