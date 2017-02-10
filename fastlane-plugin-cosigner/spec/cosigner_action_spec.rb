describe Fastlane::Actions::CosignerAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The cosigner plugin is working!")

      Fastlane::Actions::CosignerAction.run(nil)
    end
  end
end
