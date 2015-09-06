# coding: utf-8
require "ld/form"

describe LD::Form, "#title" do

  it "タイトルを返す" do
    title = "test title"
    form = LD::Form.new(title)
    expect(form.title).to eq title
  end
  
end

describe LD::Form, "#url" do
  
  before :each do
    @url = "https://example.com/endpoint"
    @form = LD::Form.new("title")
    @form.url = @url
  end

  it "URLを返す" do
    expect(@form.url.to_s).to eq @url
  end

  it "返り値の方はURI" do
    expect(@form.url.is_a?(URI)).to be true
  end

end

describe LD::Form, "::create" do
  before :all do
    @title = "new title"
    @url = "https://exmaple.com/hoge"
    @form = LD::Form.create do
      title "new title"
      url "https://exmaple.com/hoge"
    end
  end

  it "formオブジェクトを返す" do
    expect(@form.is_a?(LD::Form)).to be true
  end

  it "引数に与えたブロックで、属性を指定できる" do
    expect(@form.title).to eq @title
    expect(@form.url.to_s).to eq @url
  end

end

