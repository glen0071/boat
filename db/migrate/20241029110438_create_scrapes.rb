class CreateScrapes < ActiveRecord::Migration[7.0]
  def change
    create_table :scrapes do |t|
      t.string :url
      t.string :jurisdiction
      t.integer :records_scraped
      t.string :last_scraped
      t.string :scraper

      t.timestamps
    end
  end
end
