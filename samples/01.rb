# coding: utf-8
<<<<<<< HEAD
require "../lib/ld/form"

#form = LD::Form.create("お酒に関するアンケート")
form = LD::Form.create do
	#title "title"だとitemsが作成されない？
	initialize "お酒に関するアンケート"
	url "https://example.com/foo/bar"
end

#確認フェイズ
print("URL:")
puts(form.url)
print("TITLE:")
puts(form.title)

#item.setTitle("一番よく飲むお酒を教えてください");
item.setChoices([
                  "ビール",
                  "日本酒",
                  "焼酎",
                  "ウィスキー"
                ]);

=begin
form.add_checkbox do
  title "一番好きな好きなビールのスタイルを教えてください"
  choices ["ラガー", "エール", "ポーター", "スタウト"]
  choice "ヴァイツェン"
  choice "IPA"
end
=======
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
>>>>>>> chikoski/master

end
<<<<<<< HEAD
=end
puts form.to_jsonld
=======

graph = form.to_rdf
p graph.dump(:jsonld)
>>>>>>> chikoski/master
