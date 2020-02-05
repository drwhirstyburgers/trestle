function stripePayments(){
    var stripe = Stripe(document.getElementById('abcId').value);
    var elements = stripe.elements();
    var style = {
        base: {
          // Add your base input styles here. For example:
          fontSize: '16px',
          color: '#32325d',
        },
    };
    var card = elements.create('card', {style: style});
    card.mount('#card-element');
    var form = document.getElementById('payment-form');
    form.addEventListener('submit', function(event) {
    event.preventDefault();

    stripe.createToken(card).then(function(result) {
        if (result.error) {
            // Inform the customer that there was an error.
            var errorElement = document.getElementById('card-errors');
            errorElement.textContent = result.error.message;
        } else {
            // Send the token to your server.
            stripeTokenHandler(result.token);
        }
    });
    });
}

document.addEventListener("turbolinks:load", () => {
    //stripePayments()
});