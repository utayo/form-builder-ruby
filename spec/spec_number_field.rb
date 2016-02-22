# coding: utf-8
require "ld/form"
require "ld/form/number_field"

describe LD::Form::NumberField, "min" do

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

describe LD::Form::NumberField, "max" do

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

describe LD::Form::NumberField, "to_rdf" do

  it "RDF表現を返す" do
  end

  it "rdf:class の値は BASE/number_field である" do
  end

  it "BASE/number_field#min 属性で最小値を参照できる" do
  end

  it "BASE/number_field#max 属性で最大値を参照できる" do
  end

end


describe LD::Form::NumberField, "allows" do

  it "そのフィールドで許容する数値型を返す" do
    
  end

  context "引数が与えられた場合" do

    context "引数が :integer の場合" do
      it "型を:integerに変更し、その型を返す" do
      end
    end

    context "引数が :float　の場合" do
      it "型を:floatに変更し、その型を返す" do
      end
    end

    context "引数が \"integer\" の場合" do
      it "型を:integerに変更し、その型を返す" do
      end
    end

    context "引数が \"float\" の場合" do
      it "型を:floatに変更し、その型を返す" do
      end
    end


    context "それ以外" do
      it "型を変更せず、型を返す" do
      end
    end

  end
  
end
