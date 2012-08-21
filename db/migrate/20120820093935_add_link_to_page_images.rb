class AddLinkToPageImages < ActiveRecord::Migration
  def change
    add_column Refinery::ImagePage.table_name,  :link_to,   :string
  end
end
