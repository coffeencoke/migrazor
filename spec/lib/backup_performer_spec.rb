require_relative '../../lib/backup_performer'

describe BackupPerformer do
  describe "when no server configuration exists" do
    it 'is not ready' do
      subject.should_not be_ready
    end

    it 'has errors describing how to get ready' do
      subject.errors.should == ['No config/server.yml config file found.']
    end
  end
end