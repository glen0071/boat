class AddUserToAuthorsSourcesQuotesTopics < ActiveRecord::Migration[6.0]
  def change
    add_reference :authors, :user, null: true, foreign_key: true
    add_reference :sources, :user, null: true, foreign_key: true
    add_reference :quotes,  :user, null: true, foreign_key: true
    add_reference :topics,  :user, null: true, foreign_key: true
  end
end
