body = 
  "aaaaaaaaaaaaaaaaaaa
   iiiiiiiiiiiiiiiiiii
   uuuuuuuuuuuuuuuuuuu\n
   eeeeeeeeeeeeeeeeeee"

%w(Taro Jiro Hana).each do |name|
  member=Member.find_by(name: name)
  0.upto(9) do |idx|
    Entry.create(
      author: member,
      title: "野球観戦#{idx}",
      body: body,
      posted_at: 10.days.ago.advance(days: idx),
      status: %w(draft member_only public)[idx%3]
    )
  end
end