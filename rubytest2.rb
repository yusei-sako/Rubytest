# while
i = 0
while i < 10 do
  puts "#{i}: hello"
  # i = i + 1
  i += 1
end

# times
10.times do |i| # 10回行う
  puts "#{i}: hello"
end
# 10.times { |i| puts "#{i}: hello" }

# for
for i in 15..20 do
  p i
end
# (15..20).each do |i| これでも同じ結果になる
#   p i
# end
=begin
15
16
17
18
19
20
=end

for color in ["red", "blue"] do
  p color
end
# ["red", "blue"].each do |color|
#   p color
# end
for name, score in {sako:200, fkoji:400} do
  puts "#{name}: #{score}"
end
# {sako:200, fkoji:400}.each do |name, score|
#   puts "#{name}: #{score}"
# end

# loop
# i = 0
# loop do
#   p i
#   i += 1
# end
10.times do |i| # 10まで繰り返す
  if i == 7 then # 7になるとループを抜ける
    break
  end
  p i
end
10.times do |i| # 10まで繰り返す
  if i == 7 then # 7を飛ばして次
    next
  end
  p i
end

# メソッド
def sayHi(name = "tom") # (引数) デフォルト値を入れられる
  puts "hi! #{name}"
end
sayHi "sako" # 実行
sayHi

def sayHi(name = "tom") # (引数) デフォルト値を入れられる
  return "hi! #{name}" # 値を返す
end
p sayHi # "hi! tom"

# クラス
# クラスメソッド
# クラスメソッド
class User

  attr_accessor :name
  # attr_reader :name
  # setter: name=(value)
  # getter: name

  @@count = 0
  VERSION = 1.1

  def initialize(name)
    @@count += 1
    @name = name
  end
  def sayHi # メソッド
    # self
    # self.name -> @name
    puts "hi! i am #{@name}"
    # puts "hi! i am #{self.name}"
    # puts "hi! i am #{name}"
  end

  # オーバーライド
  def sayHi # メソッド
    puts "hi! from admin!"
  end

  def self.info
    puts "#{VERSION}: User Class, #{@@count} instances."
  end
end
tom = User.new("tom")
tom.sayHi
bob = User.new("bob")
bob.sayHi

tom.name = "tom Jr."
p tom.name
tom.sayHi # レシーバー

tom = User.new("tom")
bob = User.new("bob")
steve = User.new("steve")
User.info # Userの数をカウント 5
p User::VERSION

# User: 親クラス、 Super class
# AdminUser: 子クラス、Sub Class
class AdminUser < User # クラスを継承
  def sayHello
    puts "Hello from #{@name}"
  end
end
tom = AdminUser.new("bob")
tom.sayHi
tom.sayHello

# アクセス権
# public
# protected
# private: レシーバーを指定できない
class User2
  def sayHi2
    puts "hi!"
    sayPrivate
  end
  private
    def sayPrivate
      puts "private"
    end
end
class AdminUser2 < User2
  def sayHello2
    puts "hello!"
    sayPrivate
  end
end
User2.new.sayHi2
# hi!
# private
AdminUser2.new.sayHello2
# hello!
# private

# module
# 名前空間

module Movie
  VERSION = 1.1
  def self.encode
    puts "encoding..."
  end
  def self.export
    puts "exporting..."
  end
end
Movie.encode
Movie.export
p Movie::VERSION

# ミックスイン
module Debug
  def info
    puts "#{self.class} debug info ..."
  end
end
class Player
  include Debug
end
class Monster
  include Debug
end
Player.new.info
Monster.new.info

# 例外
class MyError < StandardError; end# 自分でエラー処理を作る
x = gets.to_i # 入力
begin
  if x == 3
    raise MyError
  end
  p 100 / x
rescue MyError
  puts "not 3!"
rescue => ex # 例外発生した時
  p ex.message
  p ex.class
  puts "stopped!"
ensure # 必ず出る
  puts "-- END --"
end
