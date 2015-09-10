# coding: utf-8
require "ld/form"

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

end

puts form.to_json
