class RemoveCaptionFromItem < ActiveRecord::Migration
  def change
  	remove_column :items, :caption_top
	remove_column :items, :caption_top_font
	remove_column :items, :caption_top_font_size
	remove_column :items, :caption_bottom
	remove_column :items, :caption_bottom_font
	remove_column :items, :caption_bottom_font_size
  end
end
