require 'backup_location'
require 'date'

describe BackupLocation do
  let(:initial_directory) { File.expand_path(File.join(__FILE__, '..', '..', '..', 'backups', Date.today.to_s)) }

  context "when no backup exists" do
    it "is labeled with today's date and is in the backup directory" do
      BackupLocation.new.directory.should == initial_directory
    end
  end

  context "when a backup exists for today" do
    before do
      File.should_receive(:exists?).with(initial_directory).and_return(true)
      File.should_receive(:exists?).with(initial_directory + "_1").and_return(false)
    end

    it "increments the name of the folder by one" do
      BackupLocation.new.directory.should == (initial_directory + "_1")
    end
  end

  context "when more than one back ups exist for today" do
    before do
      File.should_receive(:exists?).with(initial_directory).and_return(true)
      File.should_receive(:exists?).with(initial_directory + "_1").and_return(true)
      File.should_receive(:exists?).with(initial_directory + "_2").and_return(false)
    end

    it "increments the name of the folder by one" do
      BackupLocation.new.directory.should == (initial_directory + "_2")
    end
  end
end