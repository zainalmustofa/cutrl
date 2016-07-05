require 'rails_helper'

RSpec.describe "contactforms/show", type: :view do
  before(:each) do
    @contactform = assign(:contactform, Contactform.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
