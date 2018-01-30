class BalancesController < ApplicationController
  before_action :authenticate_user!
  #protect_from_forgery :except => [:event]

  def index
  end

  def new
    @balance = Balance.new
  end

  def create
    @balance = Balance.new(balances_params)
    @balance.end = @balance.start
    @balance.allday = "true"
    @balance.user_id = current_user.id
    if @balance.save
      redirect_to balances_path, notice: "収支を登録しました！"
    else
      render 'new'
    end
  end

  def show

  end

  private
    def balances_params
      params.require(:balance).permit(:start, :result, :title)
    end

end
