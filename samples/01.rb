# coding: utf-8
require "ld/form"

form = LD::Form.create("お酒に関するアンケート");
form.set_url("https://example.com/foo/bar");

item = form.add_checkbox
item.setTitle("一番よく飲むお酒を教えてください");
item.setChoices([
                  "ビール",
                  "日本酒",
                  "焼酎",
                  "ウィスキー"
                ]);

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

puts form.to_jsonld
