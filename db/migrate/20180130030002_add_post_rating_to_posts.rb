class AddPostRatingToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :post_rating, :integer
  end
end
