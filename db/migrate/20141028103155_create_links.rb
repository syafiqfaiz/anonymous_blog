class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.belongs_to :tag
      t.belongs_to :post

      t.timestamp
    end
  end
end
