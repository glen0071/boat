class CreateLastScrapedPages < ActiveRecord::Migration[7.0]
  def change
    create_table :last_scraped_pages do |t|
      t.integer :page_number

      t.timestamps
    end
  end
end
