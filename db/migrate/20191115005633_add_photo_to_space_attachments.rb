class AddPhotoToSpaceAttachments < ActiveRecord::Migration[5.2]
  def change
    add_column :space_attachments, :photo, :string
  end
end
