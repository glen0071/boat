class QuoteTopicsController < ApplicationController
  def update
    qt = QuoteTopic.find(params[:id])

    if params[:mutate] == 'add'
      qt.update points: qt.points + 1
    elsif params[:mutate] == 'subtract'
      qt.update points: qt.points - 1
    end

    redirect_to qt.topic
  end
end
