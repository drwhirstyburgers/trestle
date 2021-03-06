class ChargesController < ApplicationController
    require 'stripe'

    def create
        Stripe.api_key = ENV['STRIPE_SECRET_KEY']
        # Creates a Stripe Customer object, for associating
        # with the charge
        customer = Stripe::Customer.create(
          email: current_user.email,
          card: params[:stripeToken]
        )
      
        # Where the real magic happens
        charge = Stripe::Charge.create(
          customer: customer.id, # Note -- this is NOT the user_id in your app
          amount: 50,
          description: "BigMoney Membership - #{current_user.email}",
          currency: 'usd'
        )
      
        flash[:notice] = "Thanks for enrolling!, #{current_user.email}!"
        redirect_to user_path(current_user) # or wherever
      
        # Stripe will send back CardErrors, with friendly messages
        # when something goes wrong.
        # This `rescue block` catches and displays those errors.
        rescue Stripe::CardError => e
          flash[:alert] = e.message
          redirect_to new_charge_path
    end

end
