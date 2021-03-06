# frozen_string_literal: true

class CreateProjects < ActiveRecord::Migration[5.2]
  def self.up
    create_table :projects do |t|
      t.string :title
      t.text   :description
      t.string :category
      t.string :engine
      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
