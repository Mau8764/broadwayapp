class AddPlayIdToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :play_id, :integer
  end
end
