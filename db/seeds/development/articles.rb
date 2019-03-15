body=
"鳥居 乾いた雲\n
夏の匂いが頬を撫でる
大人になるまでほら、背伸びしたままで
遊び疲れたらバス停裏で空でも見よう
じきに夏が暮れても きっときっと覚えてるから"

0.upto(9) do |idx|
  Article.create(
    title: "article#{idx}",
    body: body,
    released_at: 8.day.ago.advance(days: idx),
    expired_at: 2.day.ago.advance(days: idx),
    member_only: (idx%3==0)
  )
end