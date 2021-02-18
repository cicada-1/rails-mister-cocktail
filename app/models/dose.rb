class Dose < ApplicationRecord
  belongs_to :cocktail_id
  belongs_to :ingredient_id
end
