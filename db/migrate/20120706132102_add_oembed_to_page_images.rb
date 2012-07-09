class AddOembedToPageImages < ActiveRecord::Migration
  def change
    add_column Refinery::ImagePage.table_name, :oembed_url, :string
    add_column Refinery::ImagePage.table_name, :oembed_data, :text
  end
end