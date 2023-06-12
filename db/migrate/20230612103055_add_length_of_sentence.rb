class AddLengthOfSentence < ActiveRecord::Migration[7.0]
  def change
    add_column :mn_doc_data, :average_length_of_sentence, :integer
  end
end
