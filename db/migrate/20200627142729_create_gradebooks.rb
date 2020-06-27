class CreateGradebooks < ActiveRecord::Migration[6.0]
  def change
    create_table :gradebooks do |t|
      t.string :subject
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
