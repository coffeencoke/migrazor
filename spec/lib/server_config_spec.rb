require 'server_config'

describe ServerConfig do
  let(:server_config_path) { File.expand_path(File.join(__FILE__, '..', '..', '..', 'config', 'server.yml'))}

  subject { ServerConfig.instance }

  context "when there is no server config file" do
    before do
      File.stub(:exists?).with(server_config_path).and_return(false)
    end

    it 'is invalid' do
      subject.should_not be_valid
    end

    it 'contains a message to help me know what to do' do
      subject.errors[:config_file].should == ['not found, please ensure that the config/server.yml file exists.']
    end
  end

  context "when there is a server config file" do
    before do
      File.stub(:exists?).with(server_config_path).and_return(true)
    end

    it 'is valid' do
      subject.should be_valid
    end
  end
end