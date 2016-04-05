class AddCaptionToItem < ActiveRecord::Migration
  def change
	add_column :items, :caption_top, :string
	add_column :items, :caption_top_font, :string
	add_column :items, :caption_top_font_size, :integer
	add_column :items, :caption_bottom, :string
	add_column :items, :caption_bottom_font, :string
	add_column :items, :caption_bottom_font_size, :integer
  end
end
