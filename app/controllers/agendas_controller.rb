class AgendasController < ApplicationController
  before_action :set_agenda, only: %i[show edit update destroy]

  def index
    @agendas = Agenda.all
  end

  def new
    @team = Team.friendly.find(params[:team_id])
    @agenda = Agenda.new
  end

  def create
    @agenda = current_user.agendas.build(title: params[:title])
    @agenda.team = Team.friendly.find(params[:team_id])
    current_user.keep_team_id = @agenda.team.id
    if current_user.save && @agenda.save
      redirect_to dashboard_url, notice: I18n.t('views.messages.create_agenda')
    else
      render :new
    end
  end
  def destroy
    if owner_or_author?(@agenda)
      @agenda_title = @agenda.title
      @users = @agenda.team.members
      if @agenda.destroy
        @users.each do |user|
          DeletedAnnounceMailer.deleted_announce_mailer(user, @agenda_title).deliver
        end
        redirect_to dashboard_path
      end
    end
  end

  private

  def set_agenda
    @agenda = Agenda.find(params[:id])
  end

  def agenda_params
    params.fetch(:agenda, {}).permit %i[title description]
  end

  def owner_or_author?(agenda)
    # binding.pry
    agenda.team.owner_id == current_user.id or agenda.user_id == current_user.id
  end
end
