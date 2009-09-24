class CreateTinyMceMedia < ActiveRecord::Migration
  def self.up
    create_table :prints do |t|
	#(Includes the file with image content)
         t.string    :image_file_name          #Uploading file/image
         t.string    :image_file_size
         t.string    :image_content_type
         t.timestamps
    end
  
    create_table :videos do |t|
	#(Includes the file with original content)
         t.string    :original_file_name          #Uploading file/image
         t.string    :original_file_size
         t.string    :original_content_type
         t.timestamps
    end
  end

  def self.down
    drop_table :prints
    drop_table :videos
  end
end