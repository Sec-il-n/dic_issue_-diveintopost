class DeletedAnnounceMailer < ApplicationMailer
  def deleted_announce_mailer(user, title)
    # @users = users
    @agenda_title = title
      mail to: user.email, subject:
      I18n.t('views.messages.delete_agenda')
  end
end
