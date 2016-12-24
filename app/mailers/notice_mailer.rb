class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_blog.subject
  #
  def sendmail_blog(blog)
    @blog = blog

    mail to: "yuji05225818@gmail.com",
    subject: '【Achieve】ブログが投稿されました'
  end
  def sendmail_contact(contact)
    @contact = contact

    mail to: "yuji05225818@gmail.com",
    subject: '【Achieve】問い合わせを頂きました'
  end
end
