class Todo < ApplicationRecord
    def change
      create_table :articles do |t|
        t.string :name
        t.boolean :done

        t.timestamps
    end
  end
end
