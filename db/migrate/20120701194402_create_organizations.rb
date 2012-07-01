class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table(:organizations) do |t|
      t.string :name, null: false
      t.string :subdomain, limit: 50, null: false
      t.timestamps
    end

    add_index(:organizations, :subdomain, unique: true) 
  end
end
