class AddAuthorToMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :author, :string
  end
end
