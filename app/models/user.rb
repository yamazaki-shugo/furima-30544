class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do 
    validates :nickname

    with_options format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
      validates :first_name_zen
      validates :last_name_zen
    end
    with_options format: { with: /\A[ァ-ン]+\z/ }do
      validates :first_name_kana
      validates :last_name_kana
    end
    validates :birth_day
  end
  
end
