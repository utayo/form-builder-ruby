# coding: utf-8
require "ld/form"
require "ld/form/text_area"

describe LD::Form::TextArea, "min_length" do

  it "そのフィールドで許容する最小値を返す" do
  end

  context "引数に数値が与えられた場合" do
    it "最小値をその数値に変更し、最小値を返す" do
    end
  end

  context "引数に数値以外が指定された場合" do
    it "最小値を変更せず、それまでの最小値を返す" do
    end
  end
  
end

describe LD::Form::TextArea, "max_length" do

  it "そのフィールドで許容する最大値を返す" do
  end

  context "引数に数値が与えられた場合" do
    it "最大値をその数値に変更し、最大値を返す" do
    end
  end

  context "引数に数値以外が指定された場合" do
    it "最大値を変更せず、それまでの最大値を返す" do
    end
  end
  
end

describe LD::Form::TextArea, "to_rdf" do

  it "RDF表現を返す" do
    
  end

  it "rdf:class の値は BASE/text_area である" do
  end

  it "BASE/text_area#min_length 属性で最小値を参照できる" do
  end

  it "BASE/text_area#max_length 属性で最大値を参照できる" do
  end
  
end
