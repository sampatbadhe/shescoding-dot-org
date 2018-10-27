class UpdateResourcesDescriptionDataType < ActiveRecord::Migration[4.2]
  def change
    change_column :resources, :description, :text
  end
end
