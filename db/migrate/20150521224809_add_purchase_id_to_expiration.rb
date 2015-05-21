class AddPurchaseIdToExpiration < ActiveRecord::Migration
  def change
    add_reference :expirations, :purchase, index: true, foreign_key: true
  end
end
