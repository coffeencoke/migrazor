require 'active_model'

class BackupPerformer
  include ActiveModel::Validations
  
  attr_accessor :backup_location

  validates :server_config, :presence => { :message => 'not found, please ensure that the config/server.yml file exists.'}

  def initialize(*args)
    self.backup_location = BackupLocation.new
  end

  delegate :directory, :to => :backup_location, :prefix => true

  def ready?
    valid?
  end

  def call

  end

  def server_config
    nil
  end
end