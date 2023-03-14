class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :content, polymorphic: true
      t.belongs_to :user, index: true, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
