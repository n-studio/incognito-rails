class CreateIncognitoObfuscatedPaths < ActiveRecord::Migration[6.1]
  def change
    create_table :incognito_obfuscated_paths do |t|
      t.string :uuid, null: false, index: { unique: true }
      t.string :session, index: true
      t.string :method
      t.string :path, null: false
      t.string :query_string

      t.datetime :expires_at, index: true
    end
  end
end
