# frozen_string_literal: true

class AddS3KeyToAsset < ActiveRecord::Migration[5.2]
  def self.up
    add_column :assets, :s3_key, :string
  end

  def self.down
    remove_column :assets, :s3_key
  end
end
