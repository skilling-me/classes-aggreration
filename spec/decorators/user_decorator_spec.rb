require 'rails_helper'

describe UserDecorator do

   user = User.new(
      first_name: 'John',
      last_name: 'Smith',
      email: 'john@example.com',
      password: '123456789'
    )

  describe "#user.decorate.name" do
    subject { user.decorate.name }
    it { is_expected.to eq 'John Smith' }
  end

end
