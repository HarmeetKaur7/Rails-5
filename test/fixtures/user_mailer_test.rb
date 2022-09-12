require 'test_helper'

#UNIT TESTING FOR ACTION MAILER 'USER MAILER'

class UserMailerTest < ActionMailer::TestCase
  #  test "mailer" do
   
  #   email= UserMailer.sending_article_to_user(@article)
  #   email.to="hamu20017@gmail.com"
  #   assert_emails 1 do
  #     email.deliver_now
  #   end

  #   assert_equal ['hammu20017@gmail.com'],email.from
  #   assert_equal ['hamu20017@gmail.com'],email.to
  #   assert_equal 'Demo for Active job',email.subject
  #  end

   test "invite mail" do
    email= UserMailer.invite
    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ['hammu20017@gmail.com'],email.from
    assert_equal ['hamu20017@gmail.com'],email.to
    assert_equal 'invitation',email.subject
    # assert_equal read_fixture('mailer2').join, email.body.to_s
   end
end
