class AddAttachmentImageToPosts < ActiveRecord::Migration[7.2]
  def change
    change_table :posts do |t|
      t.attachment :image # Esto agrega todos los campos necesarios para Paperclip
    end
  end
end
