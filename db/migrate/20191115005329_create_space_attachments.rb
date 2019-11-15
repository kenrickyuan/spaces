class CreateSpaceAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :space_attachments do |t|
      t.integer :space_id

      t.timestamps
    end
  end
end
