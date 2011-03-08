class TinyMigrationGenerator < Rails::Generators::Base 
  require 'rails/generators'
  require 'rails/generators/migration'     

  include Rails::Generators::Migration
  source_root File.expand_path('../templates', __FILE__)
  # Implement the required interface for Rails::Generators::Migration.
  # taken from http://github.com/rails/rails/blob/master/activerecord/lib/generators/active_record.rb
  def self.next_migration_number(dirname)
    if ActiveRecord::Base.timestamped_migrations
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    else
      "%.3d" % (current_migration_number(dirname) + 1)
    end
  end

  def create_migration_file
    migration_template 'migration.rb', 'db/migrate/create_tiny_mce_media.rb'
  end
end
