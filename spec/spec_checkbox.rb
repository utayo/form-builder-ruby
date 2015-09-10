# coding: utf-8
require "ld/form"
require "ld/form/item"
require "ld/form/checkbox"
require "ld/form/option"

describe LD::Form::Checkbox, "::new" do

  before :all do
    @form = LD::Form.create do
      title "new form"
      url "http://example.com/"
    end

    @checkbox = LD::Form::Checkbox.new(@form, "a checkbox")
  end

  it "基底クラスは LD::Form::Item" do
    expect(@checkbox.is_a?(LD::Form::Item)).to be true
  end

end

describe "LD::Form::Checkbox", "#option" do

  before :each do
    @form = LD::Form.create do
      title "new form"
      url "http://example.com/"
    end
    @checkbox = LD::Form::Checkbox.new(@form, "a checkbox")
    @option_a = LD::Form::Option.new("option_a")
    @option_b = LD::Form::Option.new("option_b")
  end

  it "Setのサブクラスを返す" do
    expect(@checkbox.option.is_a?(Set)).to be true
  end

  it "初期状態の長さは0" do
    expect(@checkbox.option.length).to eq 0
  end

  it "引数にLD::Form::Optionオブジェクトを指定すると、選択肢を追加できる" do
    @checkbox.option(@option_a)
    expect(@checkbox.option.length).to eq 1
  end

  it "引数に指定した文字列を選択肢として追加する" do
    expect(@checkbox.option.length).to eq 0
    new_option = "new option"
    expect(@checkbox.option(new_option).length).to eq 1
  end

end

describe LD::Form::Checkbox, "#options" do
  before :each do
    @form = LD::Form.create do
      title "new form"
      url "http://example.com/"
    end
    @checkbox = LD::Form::Checkbox.new(@form, "a checkbox")
    @options_array = ["a", "b", "c", "d"]
    @set = Set.new(["e", "f", "g", "h"])
  end

  it "Setのインスタンスを返す" do
    expect(@checkbox.options.is_a?(Set)).to be true
  end

  it "引数に配列を与えると、その中の文字列型の要素を全て選択肢として追加する" do
    expect(@checkbox.options(@options_array).length).to eq 4
  end
  
  it "引数にSetを与えると、その中の文字列型の要素を全て選択肢として追加する" do
    expect(@checkbox.options(@set).length).to eq 4
  end

  it "引数に追加したい選択肢を可変個指定できる" do
    expect(@checkbox.options.length).to eq 0
    expect(@checkbox.options("a", "b").length).to eq 2
    expect(@checkbox.options("c").length).to eq 3
    expect(@checkbox.options("d", "f", "g", "h", "i").length).to eq 8
  end
end

describe LD::Form::Checkbox, "#to_h" do
  before :all do
    @form = LD::Form.create do
      title "new form"
      url "http://example.com/"
    end
    @checkbox = LD::Form::Checkbox.new(@form, "a checkbox")
    @checkbox.options("a", "b", "c", "d")
    
    @hash = @checkbox.to_h
  end

  it "返り値の:title属性にタイトルが代入されている" do
    expect(@hash[:title]).to eq @checkbox.title
  end

  it ":options属性に、その設問の選択肢集合が代入されている" do
    expect(@hash[:options]).to be_an_instance_of(Hash)
    expect(@hash[:options][:type]).to eq @checkbox.options.class.to_s
    expect(@hash[:options][:items]).to be_an_instance_of(Array)
    expect(@hash[:options][:items].length).to be 4

    @form.options.map{|i|
      i.url
    }.each{|url|
      expect(@hash[:options][:items].include?(url)).to be true       
    }
  end

end
