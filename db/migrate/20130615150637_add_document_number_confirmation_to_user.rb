class AddDocumentNumberConfirmationToUser < ActiveRecord::Migration
  def change
    add_column :users, :document_number_confirmation, :string
  end
end
