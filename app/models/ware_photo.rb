class WarePhoto < ApplicationRecord
  belongs_to :ware_content
  
  validates :image, presence: true
end
