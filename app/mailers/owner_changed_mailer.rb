class OwnerChangedMailer < ApplicationMailer
  def owner_changed(user)
    @email = user.email
    mail to: user.email, subject: I18n.t('views.messages.team_owner_changed')
  end
end
