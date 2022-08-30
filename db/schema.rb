Sequel.migration do
  change do
    create_table(:applications) do
      primary_key :id, :type=>"int"
      column :uuid, "varchar(255)"
      column :title, "varchar(255)"
      column :reference, "varchar(255)"
      column :created_at, "datetime(6)"
      column :updated_at, "datetime(6)"
    end
    
    create_table(:schema_migrations) do
      column :filename, "varchar(255)", :null=>false
      
      primary_key [:filename]
    end
  end
end
Sequel.migration do
  change do
    self << "INSERT INTO `schema_migrations` (`filename`) VALUES ('20220826182209_create_applications.rb')"
  end
end
