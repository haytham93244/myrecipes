class Recipe < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true, length: { minimum: 5, maximum: 500 }

    belongs_to :chef
    validates :chef_id ,presence: true
    #default_scope -> {order(updated_at: :desc)}
    default_scope -> { order(name: :asc)}
    
    has_many :recipe_ingredients
    has_many :ingredients ,through: :recipe_ingredients

    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy

    #mount_uploader :recipeimage, RecipeUploader

    def thumbs_up_sum
      self.likes.where(like: true).size
    end
    
    def thumbs_down_sum
      self.likes.where(like: false).size    
    end
  
    def self.by_likes
      all.sort_by{|likes| likes.thumbs_up_sum}.reverse
    end
  
    def self.by_chefs
      all.sort_by(&:chef_id)
    end
end
