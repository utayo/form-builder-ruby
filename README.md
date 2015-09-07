# form-builder-ruby

質問票データを作るためのRubyライブラリ。

## 想定する使用法

  form = LD::Form.create do
   title "ビールについての意識調査"
    url "http://example.com/beer/"
    checkbox do
      title "ビールをどれくらい飲みますか？"
      options ["よく飲む", "時々飲む", "乾杯くらい", "全く飲まない"]
    end
    multiple_choice do
      tille "好きなスタイルを教えてください"
      options ["ピルスナー", "スタウト", "ヴァイツェン", "エール", "IPA"]
    end
  end
  
  json = form.to_json
