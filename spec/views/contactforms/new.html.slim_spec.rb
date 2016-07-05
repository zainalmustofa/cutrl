require 'rails_helper'

RSpec.describe "contactforms/new", type: :view do
  before(:each) do
    assign(:contactform, Contactform.new())
  end

  it "renders new contactform form" do
    render

    assert_select "form[action=?][method=?]", contactforms_path, "post" do
    end
  end
end
