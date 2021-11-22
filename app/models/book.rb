class Book < ApplicationRecord
  belongs_to :user
  attachment :book
end
