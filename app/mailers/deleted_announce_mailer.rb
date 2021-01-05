class DeletedAnnounceMailer < ApplicationMailer
  def deleted_announce_mailer(users, title)
    @users = users
    @agenda_title = title
    @users.each do |user|
      mail to: user.email, subject:
      I18n.t('views.messages.delete_agenda')
    end
  end
end
