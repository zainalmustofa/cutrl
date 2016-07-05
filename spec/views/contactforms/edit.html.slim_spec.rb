require 'rails_helper'

RSpec.describe "contactforms/edit", type: :view do
  before(:each) do
    @contactform = assign(:contactform, Contactform.create!())
  end

  it "renders the edit contactform form" do
    render

    assert_select "form[action=?][method=?]", contactform_path(@contactform), "post" do
    end
  end
end
