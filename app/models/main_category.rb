class MainCategory < ApplicationRecord
	has_many :categories
	has_many :products, through: :categories
	validates :gender, presence: true


	def self.for_select
    MainCategory.all.map do |mc|
      [mc, mc.categories.map { |c| [c.id, c.title] }]
    end
  end
  
end
