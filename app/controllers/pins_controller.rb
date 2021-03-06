class PinsController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  before_action :set_pin, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @pins = Pin.all
    respond_with(@pins)
  end

  def show
    respond_with(@pin)
  end

  def new
    @pin = current_user.pins.new
    respond_with(@pin)
  end

  def edit
    @pin = current_user.pins.find(params[:id])
  end

  def create
    @pin = current_user.pins.new(pin_params)
    @pin.save
    respond_with(@pin)
  end

  def update
    @current_user.update(pin_params)
    respond_with(@pin)
  end

  def destroy
    @current_user.destroy
    respond_with(@pin)
  end

  private
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def pin_params
      params.require(:pin).permit(:description)
    end
end
