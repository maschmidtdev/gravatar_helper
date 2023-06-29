require 'gravatar_helper'
require 'digest'

describe GravatarHelper::Generator do

  test_name = "mashrur"
  test_email = "mashrur@example.com"

  it "generates a gravatar url" do
    user = double(username: test_name, email: test_email)
    expect(GravatarHelper::Generator.generate(user)).to include("https://www.gravatar.com/avatar/")
  end

  it "considers the size option" do
    user = double(username: test_name, email: test_email)
    expect(GravatarHelper::Generator.generate(user, { size: 150})).to include("?s=150")
  end

  it "creates an img tag" do
    user = double(username: test_name, email: test_email)
    expect(GravatarHelper::Generator.generate(user)).to include("<img")
  end

end