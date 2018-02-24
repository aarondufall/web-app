Hanami::Model.migration do
  change do
    create_table :profiles do
      primary_key :id, 'uuid', null: false

      column :name, String, null: false
      column :email, String, null: false
      column :avatar_url, String

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
