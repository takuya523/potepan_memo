require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。
if memo_type == 1
  puts "拡張子を除いたファイルを入力してください"
  file_name = gets.chomp.to_s
  p "メモしたい内容を記入してください"
  p "完了したらCtrl + Dを押してください"
  input = STDIN.read.chomp
  
  CSV.open("#{file_name}.csv","w") do |contents_memo|
    contents_memo << ["#{input}"]
  end

elsif memo_type == 2
  puts "既存のファイルを編集します。拡張子を除いたファイルを入力してください"
  edit_file_name = gets.chomp.to_s
  p "編集したい内容を入力してください"
  p "完了したらCtrl + Dを押してください"
  input2 = STDIN.read.chomp

  CSV.open("#{edit_file_name}.csv","a") do |edit_contents_memo|
    edit_contents_memo << ["#{input2}"]
  end
end