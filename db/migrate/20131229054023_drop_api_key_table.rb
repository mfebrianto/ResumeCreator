class DropApiKeyTable < ActiveRecord::Migration
  def up
    drop_table :api_keys
  end
end
