class CreateBibliothecas < ActiveRecord::Migration[7.0]
  def change
    create_table :bibliothecas do |t|
      t.string :name

      t.timestamps
      20220820225625
      20220820225539
    end
  end
end
