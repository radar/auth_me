require_relative '../../../spec_helper'

describe AuthMe::Controllers::SignIn::New do
  let(:action) { AuthMe::Controllers::SignIn::New.new }
  let(:params) { Hash[] }

  it 'is successful' do
    status, _, _ = action.call(params)
    expect(status).to eq(200)
  end
end
