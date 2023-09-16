class ContactMailer < ApplicationMailer

   #メソッドに対して引数を設定
  def send_mail(mail_title, mail_content, group_members)
    @mail_title = mail_title
    @mail_content = mail_content
    mail bcc: group_members.pluck(:email), subject: @mail_title
  end
end
