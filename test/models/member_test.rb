require "test_helper"

describe Member do
  setup do
    @member=Member.new(
      number:50,
      name:"Alice",
      full_name:"Alice Barton",
      email:"alice@gmail.com",
      sex: 1,
      administrator: false,
      password: "sample",
    )
    @another_member=Member.new(
      number:60,
      name:"Bob",
      full_name:"Bob Watson",
      email:"Bob@yahoo.com",
      sex: 0,
      administrator: false,
      password: "sample2",
      password_confirmation: "sample2"
    )
  end

  test "correct member should be saved" do
    assert @member.valid?
  end

  test "number should be 1-99" do
    invalid_numbers = [-1,0,100,50.1,"aaa"]
    invalid_numbers.each do |number|
      @member.number=number
      assert_not @member.valid?
    end
  end

  test "number should be unique" do
    @another_member.number=@member.number
    @member.save
    assert_not @another_member.valid?
    "another_member number is #{@another_member.number},while member_number is #{@member.number}"
  end

  test "name should be unique" do
    @another_member.name=@member.name
    @member.save
    assert_not @another_member.valid?
    "another_member name is #{@another_member.name},while member_name is #{@member.name}"
  end

  test "name validation should reject invalid names" do
    invalid_names=["12tom", "a"*30, " ", "a"]
    invalid_names.each do |name|
      @member.name = name
      assert_not @member.valid?, "#{name} should be rejected !"
    end
  end

  test "full_name should not be too long" do
    @member.full_name="a"*21
    assert_not @member.valid?
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses=%w(aaa@com@com abcd@aaaa example abc@ee++aa)
    invalid_addresses.each do |address|
      @member.email = address
      assert_not @member.valid?, "#{address} should be rejected !"
    end
  end

  test "password should be exist when create" do
    @member.password = " "
    assert_not @member.valid?, "member password is #{@member.password}"
  end

  test "password should be exist when update" do
    @member.save
    @member.current_password=@member.password
    @member.password = " "
    assert_not @member.valid?, "member password is #{@member.password}"
  end
end
