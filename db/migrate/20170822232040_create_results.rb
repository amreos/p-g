class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :min
      t.string :max
      t.string :time
      t.string :exps
      t.references :machine, index: true, foreign_key: true
      t.string :line
      t.string :ideal
      t.string :midr

      t.timestamps null: false
    end
  end
end
