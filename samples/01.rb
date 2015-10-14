# coding: utf-8
require "ld/form"
require "ld/visualization/dot"
require "json/ld"

form = LD::Form.create do
  title "ビールに関するアンケート"
  url "http://example.com/questionaries/beer"

  checkbox do
    title "性別を教えてください"
    options "男性", "女性", "その他"
  end

  checkbox do
    title "飲酒の頻度を教えてください"
    options "毎日", "週に2、3度", "週に1度", "月に2、3度", "月に1度以下"
  end

  checkbox do
    title "一番好きなスタイルを教えてください"
    options "ラガー", "エール", "ポーター", "スタウト", "IPA", "ヴァイツェン"
  end

  number_field do
    title "一度に飲む量をパイントで教えてください"
    min 0
    max 100
  end

  text_area do
    title "ビールに対する愛を叫んでください！"
  end

end

graph = form.to_rdf
p graph.dump(:jsonld)
