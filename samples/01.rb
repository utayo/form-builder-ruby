# coding: utf-8
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

form.add_multiple_choice do
  title "好きなビールのスタイルを教えてください"
  choices ["ラガー", "エール", "ポーター", "スタウト"]
  choice "ヴァイツェン"
  choice "IPA"
  other true
end
=end
puts form.to_jsonld
