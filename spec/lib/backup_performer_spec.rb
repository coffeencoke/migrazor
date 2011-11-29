require_relative '../../lib/backup_performer'
require 'date'

describe BackupPerformer do
  it 'has a default backup location' do
    expected_backup_location = File.expand_path(File.join(__FILE__, '..', '..', '..', 'backups', Date.today.to_s))
    BackupPerformer.backup_location.should == expected_backup_location
  end

  describe "when no server configuration exists" do
    it 'is not ready' do
      subject.should_not be_ready
    end

    it 'has errors describing how to get ready' do
      subject.errors.should == ['No config/server.yml config file found.']
    end
  end
end