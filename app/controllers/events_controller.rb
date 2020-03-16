class EventsController < ApplicationController

  before_action :require_logged_in_user

  def index
    @events = current_user.events
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = 'Evento criado com sucesso.'
      redirect_to events_path
    else
      render 'new'
    end
  end

  def edit
    @event = current_user.events.find_by(id: params[:id])
    if @event.nil?
      flash[:danger] = 'Evento não encontrado.'
      redirect_to events_path(current_user)
    end
  end

  def update
    @event = current_user.events.find(params[:id])
    if @event.update(event_params)
      flash[:success] = 'Evento atualizado com sucesso.'
      redirect_to events_path
    else
      render 'edit'
    end
  end

  def show
    @event = current_user.events.find_by(id: params[:id])
    if @event.nil?
      flash[:danger] = 'Evento não encontrado.'
      redirect_to events_path(current_user)
    end
  end

  def destroy
    @event = current_user.events.find(params[:id])
    if @event.destroy
      flash[:success] = 'Evento removido com sucesso.'
      redirect_to events_path
    else
      flash[:danger] = 'Evento não encontrado.'
      redirect_to events_path(current_user)
    end
  end

  private
    def event_params
      params.require(:event).permit(:dated_at)
    end

end
