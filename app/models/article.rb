class Article < ApplicationRecord
	has_one_attached :image
	#validations
	#validates_presence_of :name, :yield, :ingredients, :recipe
end
