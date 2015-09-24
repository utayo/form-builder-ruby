# coding: utf-8
require "ld/form/multiple_choice"

describe LD::Form::MultipleChoice, "::new" do

  before :all do
    @form = LD::Form.create do
      title "new form"
      url "http://example.com/"
    end
    @item = LD::Form::MultipleChoice.new(@form, "multiple choice")
  end

  it "LD::Form::Checkbox のサブクラス" do
    expect(@item).to be_is_a LD::Form::Checkbox
  end
  
end
