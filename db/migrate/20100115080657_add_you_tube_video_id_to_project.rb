class AddYouTubeVideoIdToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :youtube_video_id, :string
  end

  def self.down
    remove_column :projects, :youtube_video_id
  end
end
