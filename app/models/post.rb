class Post < ActiveRecord::Base
    belongs_to  :user
    mount_uploader :my_image, AvatarUploader
end
