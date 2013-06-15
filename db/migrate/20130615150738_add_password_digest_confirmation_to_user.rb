class AddPasswordDigestConfirmationToUser < ActiveRecord::Migration
  def change
    add_column :users, :password_digest_confirmation, :string
  end
end
