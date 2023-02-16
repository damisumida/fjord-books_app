class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.string :title, null: false
      t.text :body
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
