require 'backup_performer'

BackupLocation = Class.new unless Kernel.const_defined?('BackupLocation')

describe BackupPerformer do
  let(:mock_backup_directory) { mock 'a directory to store the backup' }
  let(:mock_backup_location) { mock 'a backup location object', :directory => mock_backup_directory }

  before do
    BackupLocation.stub(:new => mock_backup_location)
  end

  it 'has a backup directory' do
    subject.backup_location_directory.should == mock_backup_directory
  end

  describe "when no server configuration exists" do
    it 'is not ready' do
      subject.should_not be_ready
    end

    it 'has errors describing how to get ready' do
      subject.valid?
      
      subject.errors[:server_config].should == ['not found, please ensure that the config/server.yml file exists.']
    end
  end
end