# frozen_string_literal: true

class ChangeAuthorBirthDeathDataTypes < ActiveRecord::Migration[5.2]
  def change
    change_column :authors, :birth, :string
    change_column :authors, :death, :string
  end
end
