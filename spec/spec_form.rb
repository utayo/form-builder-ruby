# coding: utf-8
require "ld/form"
require "rdf"

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

describe LD::Form, "::options" do
  before :each do
    @form = LD::Form.new("new form")
    @form.url = "http://www.example.com/a"
  end

  it "Set のインスタンスを返す" do
    expect(@form.options.is_a?(Set)).to be true
  end

  it "引数に配列を指定することで、要素を選択肢として追加できる" do
    expect(@form.options(["a", "b", "c", "d"]).length).to eq 4
  end

  it "引数に集合を指定することで、要素を選択肢として追加できる" do
    expect(@form.options(Set.new(["a", "b", "c", "d"])).length).to eq 4
  end
  
end

describe LD::Form, "#to_h" do
  
  before :all do
    @form = LD::Form.create do
      title "new form"
      url "http://www.example.com/new_form"
    end
    @hash = @form.to_h
  end

  it "url属性を持っており、指定したURLが代入されている" do
    expect(@hash[:url]).to eq @form.url
  end

  it "title属性には、Formオブジェクトで指定されたタイトルが代入されている" do
    expect(@hash[:title]).to eq @form.title
  end

end

describe LD::Form, "#to_rdf" do
  before :all do
    @form = LD::Form.create do
      title "ビールに関するアンケート"
      url "http://example.com/questionaries/beer"

      checkbox do
        title "飲酒の頻度を教えてください"
        options "毎日", "週に2、3度", "週に1度", "月に2、3度", "月に1度以下"
      end
    end
    @graph = @form.to_rdf
  end

  it "RDF::Graphを返す" do
    p @graph.to_a
    expect(@graph).to be_an_instance_of RDF::Graph
  end

end
