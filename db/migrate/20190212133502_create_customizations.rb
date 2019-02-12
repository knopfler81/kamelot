class CreateCustomizations < ActiveRecord::Migration[5.2]
  def change
    create_table :customizations do |t|
    	t.string :main_image, default: 'https://s3-eu-west-1.amazonaws.com/mygasoline/landing.jpg'
      t.timestamps
    end
  end
end
