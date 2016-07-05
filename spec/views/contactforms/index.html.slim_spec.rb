require 'rails_helper'

RSpec.describe "contactforms/index", type: :view do
  before(:each) do
    assign(:contactforms, [
      Contactform.create!(),
      Contactform.create!()
    ])
  end

  it "renders a list of contactforms" do
    render
  end
end
