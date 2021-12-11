describe Users::UseCase::RegisterUser do
  subject do
    register_user = described_class.new(gateway: FakeGateway.new)
    register_user.register(Users::UseCase::RegisterUser::Request.new(email))
  end

  context 'when user created without errors' do
    let(:email) { 'a@a.com' }
    it { expect(subject.errors).to be_empty }
  end

  context 'when user has errors' do
    let(:email) { nil }
    it { expect(subject.errors).to_not be_empty }
  end
end
