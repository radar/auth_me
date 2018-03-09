require_relative '../../../spec_helper'

describe AuthMe::Views::SignIn::New do
  let(:exposures) { Hash[format: :html] }
  let(:template)  { Hanami::View::Template.new('apps/auth_me/templates/sign_in/new.html.erb') }
  let(:view)      { AuthMe::Views::SignIn::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #format' do
    expect(view.format).to eq(exposures.fetch(:format))
  end
end
