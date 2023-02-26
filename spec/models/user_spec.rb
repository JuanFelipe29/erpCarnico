require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'factory' do
    it { expect(build(:user).valid?).to eq true }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :password }

    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

    it { is_expected.to validate_length_of(:password).is_at_least(8).is_at_most(64) }

    it { is_expected.to have_secure_password }
  end

  describe "Callbacks" do
    context 'before_validations' do
      context 'formatting_email' do
        let(:user) { build(:user, email: ' TesT@mail.com ') }

        it '' do
          user.save

          expect(user.email).to eq('test@mail.com')
        end
      end
    end
  end
end
