# coding: utf-8
require "ld/form"
require "ld/form/item"

describe LD::Form::Item, "#parent" do
  before :all do
    @form = LD::Form.new("form")
    @item = LD::Form::Item.new(@form, "hogehoge")
  end

  it "親のLD::Formオブジェクトを返す" do
    expect(@item.parent).to eq @form
  end
  
end

describe LD::Form::Item, "#title" do
  before :all do
    @form = LD::Form.new("form")
    @title = "test title"
    @item = LD::Form::Item.new(@form, @title)
  end

  it "タイトルを返す" do
    expect(@item.title).to eq @title
  end  
end

describe LD::Form::Item, "#url" do
  before :all do
    @form = LD::Form.new("form")

    @url = "https://example.com/endpoint"
    @item = LD::Form::Item.new(@form, "title")
    @item.url = @url
  end

  it "URLを返す" do
    expect(@item.url.to_s).to eq @url
  end

  it "返り値の方はURI" do
    expect(@item.url.is_a?(URI)).to be true
  end

end

describe LD::Form::Item, "::create" do
  before :all do
    @form = LD::Form.new("form")
    @title = "new title"
    @url = "https://exmaple.com/hoge"

    @item = LD::Form::Item.create(@form) do
      title "new title"
      url "https://exmaple.com/hoge"
    end
  end

  it "LD::Form::Itemオブジェクトを返す" do
    expect(@item.is_a?(LD::Form::Item)).to be true
  end

  it "引数に与えたブロックで、属性を指定できる" do
    expect(@item.title).to eq @title
    expect(@item.url.to_s).to eq @url
  end

end

