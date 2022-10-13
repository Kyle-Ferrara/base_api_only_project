# frozen_string_literal: true

Sequel.migration do
  change do
    create_table :applications do
      primary_key :id
      String :uuid
      String :title
      String :reference
      column :created_at, 'datetime(6)'
      column :updated_at, 'datetime(6)'
    end
  end
end
