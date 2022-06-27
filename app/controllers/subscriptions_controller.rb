class SubscriptionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_subscription, only: %i[index show update destroy unsub_posts]

  def index
    render :show
  end

  def subscribers
    @subscriptions = Subscription.all
  end

  def unsub_books
    @subscription.unsubscribe(:books)
    respond_to do |format|
      format.html { redirect_to root_url, alert: 'You have been unsubscribed from future book announcements.' }
    end
  end

  def unsub_posts
    @subscription.unsubscribe(:posts)
    respond_to do |format|
      format.html { redirect_to root_url, alert: 'You have been unsubscribed from future posts.' }
    end
  end

  def update
    [%i[wants_posts posts], %i[wants_books books]].each do |check, key|
      wants = subscription_params[check].nil? ? false : true
      has   = @subscription.read_attribute(key).nil? ? false : true

      @subscription.unsubscribe(key) unless wants && has
      @subscription.subscribe(key) if wants && !has
    end
    @subscription.save
    respond_to do |format|
      format.html { redirect_to subscriptions_url, notice: 'Subscription was successfully updated.' }
      format.json { render subscriptions_url, status: :ok, location: @subscription }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_subscription
    @subscription = current_user.subscription
    # @subscription = Subscription.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def subscription_params
    params.require(:subscription).permit(:wants_books, :wants_posts)
  end
end
