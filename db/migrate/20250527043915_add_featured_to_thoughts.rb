class AddFeaturedToThoughts < ActiveRecord::Migration[8.0]
  def change
    add_column :thoughts, :featured, :boolean, default: false
  end
end
