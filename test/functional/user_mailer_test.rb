require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "leave_message" do
    mail = UserMailer.leave_message
    assert_equal "Leave message", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
