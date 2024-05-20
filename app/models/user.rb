class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'must contain @' }
  validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'は全角で入力してください' }
  validates :last_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/u, message: 'は全角カタカナで入力してください' }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は半角英数字混合で入力してください' }

  # メールアドレスは@を含む必要がある
  # お名前（全角）は全角（漢字・ひらがな・カタカナ）での入力を必須とする
  # お名前カナ（全角）は全角（カタカナ）での入力を必須とする
  # パスワードは半角英数字混合であることを必須とする
  has_many :items
  has_many :orders
end
