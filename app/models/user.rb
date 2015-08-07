class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable #여기에 그리고 책보면 :confirmable 하라고 하는데 그거 하면 망함
         #걍 디비 스키마도 고치지 말고 그대로
  has_many :posts
       
end
