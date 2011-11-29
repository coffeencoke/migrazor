require 'singleton'

class ServerConfig
  include Singleton
  include ActiveModel::Validations

  validates_each :config_file do |record, attr, value|
    record.errors.add attr, 'not found, please ensure that the config/server.yml file exists.' unless File.exists?(record.config_file)
  end

  def config_file
    File.expand_path(File.join(__FILE__, '..', '..', 'config', 'server.yml'))
  end
end