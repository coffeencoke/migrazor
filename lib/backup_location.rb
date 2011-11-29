require 'date'

class BackupLocation
  attr_accessor :directory

  def initialize
    set_directory
  end

  def set_directory
    self.directory = if File.exists?(initial_directory)
      incremented_directory
    else
      initial_directory
    end
  end

  def initial_directory
    File.expand_path(File.join(__FILE__, '..', '..', 'backups', Date.today.to_s))
  end

  def incremented_directory(increment=1)
    new_directory = initial_directory + "_#{increment}"
    if File.exists?(new_directory)
      incremented_directory(increment + 1)
    else
      self.directory = new_directory
    end
  end
end