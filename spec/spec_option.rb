# coding: utf-8
require "ld/form"
require "ld/form/item"
require "ld/form/option"
require "uri"
require "set"

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

describe LD::Form::Option, "#add_parent" do

  before :each do
    @form = LD::Form.new("new form")
    @form.url = "http://example.com/"
    @item_a = LD::Form::Item.new(@form, "A")
    @item_b = LD::Form::Item.new(@form, "B")    
    @option = LD::Form::Option.new("option a")
  end

  it "その選択肢を持つ設問を追加できる" do
    expect(@option.parents.length).to eq 0
    @option.add_parent(@item_a)
    expect(@option.parents.length).to eq 1
    @option.add_parent(@item_b)
    expect(@option.parents.length).to eq 2
  end

  it "重複した設問は追加できない" do
    expect(@option.parents.length).to eq 0
    @option.add_parent(@item_a)
    expect(@option.parents.length).to eq 1
    @option.add_parent(@item_a)
    expect(@option.parents.length).to eq 1
  end  

  it "追加された設問を持つFormオブジェクトの options 属性に追加される" do
    expect(@item_a.parent.options.include?(@option)).to be false
    @option.add_parent(@item_a)
    expect(@item_a.parent.options.include?(@option)).to be true
  end
  
end

describe LD::Form::Option, "#parents" do
  before :each do
    @form = LD::Form.new("new form")
    @form.url = "http://example.com/"
    @item_a = LD::Form::Item.new(@form, "A")
    @item_b = LD::Form::Item.new(@form, "B")    
    @option = LD::Form::Option.new("option a")
  end

  it "その選択肢をもつ設問のリストを返す" do
    expect(@option.parents.length).to eq 0
    @option.add_parent(@item_a)
    expect(@option.parents.length).to eq 1
  end

  it "返り値の方はSetのサブクラス" do
    expect(@option.parents.is_a?(Set)).to be true
  end
end


describe LD::Form::Option, "#to_h" do

  before :all do
    @form = LD::Form.new("new form")
    @form.url = "http://example.com/"
    @item_a = LD::Form::Item.new(@form, "A")
    @item_b = LD::Form::Item.new(@form, "B")    
    @option = LD::Form::Option.new("option a")
    @option.add_parent(@item_a)
    @option.add_parent(@item_b)
    
    @hash = @option.to_h
  end

  it ":label属性に Option#labelの値が代入されている" do
    expect(@hash[:label]).to eq @option.label
  end

  it ":refered_from属性に、その選択肢を参照している設問のオブジェクトが代入されている" do
    expect(@hash[:refered_from]).to be_an_instance_of(Hash)
    expect(@hash[:refered_from][:type]).to eq @option.parents.class.to_s
    expect(@hash[:refered_from][:items]).to be_an_instance_of(Array)
    expect(@hash[:refered_from][:items].length).to be 2
    expect(@hash[:refered_from][:items].include?(@item_a.url)).to be true 
    expect(@hash[:refered_from][:items].include?(@item_b.url)).to be true  
  end
  
end
