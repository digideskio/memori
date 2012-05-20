class StudyController < ApplicationController
  before_filter :authorize
  def show
    @deck = Deck.find(params[:id])
    if @record = current_user.current_record_for_deck(@deck)
      @card = @record.card
    else
      @card = current_user.next_card_for_deck(@deck)
      @record = current_user.record_for_card(@card)
      @record.activate!
      @record.seen!
    end
  end
end
