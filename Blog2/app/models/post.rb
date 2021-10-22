class Post < ApplicationRecord
  validates :title, presence:true
  validates :title, uniqueness:true
  validates :content, length: { minimum:5 }
end
