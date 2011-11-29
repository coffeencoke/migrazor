require 'net/http'
require 'date'

class BackupPerformer
  def self.backup_location
    File.expand_path(File.join(__FILE__, '..', '..', 'backups', Date.today.to_s))
  end

  def initialize(global_options={}, options={}, args={})

  end

  def ready?
    false
  end

  def call

  end

  def errors
    ['No config/server.yml config file found.']
  end
end