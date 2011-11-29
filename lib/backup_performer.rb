require 'net/http'

class BackupPerformer
  def self.backup_location

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