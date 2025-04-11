class AddBrandAndCustomizationToBikes < ActiveRecord::Migration[7.2]
  def change
    add_column :bikes, :brand, :string
    add_column :bikes, :customization, :text
  end
end
