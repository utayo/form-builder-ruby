# coding: utf-8
require "ld/form/item"
require "ld/form/option"
require "uri"

describe "LD::Form::Option", "#label" do

  before :all do
    @label = "a label of an option"
    @option = LD::Form::Option.new(@label)
  end

  it "ラベルを返す" do
    expect(@option.label).to eq @label
  end

end

describe "LD::Form::Option", "#url" do

  before :each do
    @label = "a label of an option"
    @url = "http://example.com/a/b/1"
    @new_url= "http://example.com/a/b/2"
    
    @option = LD::Form::Option.new(@label, @url)
  end

  it "URIオブジェクトを返す" do
    expect(@option.url.is_a?(URI)).to be true
  end

  it "コンストラクタで指定したURLを返す" do
    expect(@option.url.to_s).to eq @url
  end

  it "引数にURLを指定することで、URLを変更できる" do
    @option.url(@new_url)
    expect(@option.url.to_s).to eq @new_url
  end

end
