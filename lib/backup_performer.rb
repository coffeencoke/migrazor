require 'active_model'

class BackupPerformer
  include ActiveModel::Validations
  
  attr_accessor :backup_location

  def initialize(*args)
    self.backup_location = BackupLocation.new
  end

  delegate :directory, :to => :backup_location, :prefix => true

  def ready?
    false
  end

  def call

  end

  def errors
    ['No config/server.yml config file found.']
  end
end