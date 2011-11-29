require 'active_model'

class BackupPerformer
  include ActiveModel::Validations
  
  attr_accessor :backup_location, :server_config

  def initialize(*args)
    self.backup_location = BackupLocation.new
    self.server_config = ServerConfig.instance
  end

  delegate :directory, :to => :backup_location, :prefix => true

  def ready?
    server_config.valid? && valid?
  end

  def call

  end
end