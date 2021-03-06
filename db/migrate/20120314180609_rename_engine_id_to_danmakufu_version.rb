# frozen_string_literal: true

class RenameEngineIdToDanmakufuVersion < ActiveRecord::Migration[5.2]
  def self.up
    rename_column :projects, :engine_id, :danmakufu_version_id
  end

  def self.down
    rename_column :projects, :danmakufu_version, :engine_id_id
  end
end
