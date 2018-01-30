class BalancesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def result
    balances = Balance.where(user_id: current_user.id)
    @chart_data = {}
    balances.each do |e|
      if e.result
        if @chart_data[e.start.to_s[5, 2]].nil?
          @chart_data[e.start.to_s[5, 2]] = e.title.to_i
        else
          @chart_data[e.start.to_s[5, 2]] += e.title.to_i
        end
      else
        if @chart_data[e.start.to_s[5, 2]].nil?
          @chart_data[e.start.to_s[5, 2]] = -e.title.to_i
        else
          @chart_data[e.start.to_s[5, 2]] -= e.title.to_i
        end
      end
    end
    @chart_data.each_value do |c|
      if @value.nil?
        @value = c
      else
        @value += c
      end
    end
  end

  def new
    @balance = Balance.new
  end

  def create
    @balance = Balance.new(balances_params)
    @balance.end = @balance.start
    @balance.allDay = "true"
    @balance.user_id = current_user.id
    if @balance.save
      redirect_to balances_path, notice: "収支を登録しました！"
    else
      render 'new'
    end
  end

  def show
    @balance = Balance.find(params[:id])
  end

  def edit
    @balance = Balance.find(params[:id])
  end

  def update
    @balance = Balance.find(params[:id])
    respond_to do |format|
      if @balance.update(balances_params)
        format.html { redirect_to @balance, notice: '収支を編集しました！' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @balance = Balance.find(params[:id])
    @balance.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: '収支を削除しました' }
    end
  end

  private
    def balances_params
      params.require(:balance).permit(:start, :result, :title)
    end

end
