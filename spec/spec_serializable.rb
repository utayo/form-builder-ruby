# coding: utf-8
require "ld/form/serializable"
require "json"

class A 
  include LD::Form::Serializable
end

describe LD::Form::Serializable, "#to_h" do
  before :all do
    @a = A.new
  end

  it "class属性にクラス名を入れたハッシュを返す" do
    expect(@a.to_h).to be_an_instance_of(Hash)
    expect(@a.to_h[:class]).to eq "A"
  end

end

describe LD::Form::Serializable, "#to_json" do
  before :all do
    @a = A.new
    @klassname = @a.to_h[:class]
  end
  
  it "#to_h の結果を JSON にして返す" do
    json = @a.to_json
    result = JSON.parse(json)
    expect(result["class"]).to eq(@klassname)
  end
  
end
