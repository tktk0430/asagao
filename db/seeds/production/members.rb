names = %w(Taro Jiro Hana John Mike Sophy Bill Alex Mary Tom kazu jasmin alex sam maria king)
fnames = ["佐藤", "鈴木", "高橋", "田中"]
gnames = ["太郎", "次郎", "花子"]
0.upto(15) do |idx|
  Member.create(
    number: idx + 10,
    name: names[idx],
    full_name: "#{fnames[idx % 4]} #{gnames[idx % 3]}",
    email: "#{names[idx]}@example.com",
    birthday: "1981-12-01",
    sex: [1, 1, 2][idx % 3],
    administrator: idx == 0,
    password: "asagao!",
    password_confirmation: "asagao!"
  )
end
