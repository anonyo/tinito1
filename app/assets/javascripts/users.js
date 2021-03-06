$(document).ready(function(){
   Stripe.setPublishableKey($("meta[name='stripe_api_key'").attr("content"));
    // Watch form submission
    $("#form-submit-btn").click(function(event){
        event.preventDefault();
        $("input[type=submit]").prop("disabled", true);
        var error = false;
        var ccNum = $("#card_number").val(),
            cvcNum = $("#card_code").val(),
            expMonth = $("#card_month").val(),
            expYear = $("#card_year").val();

        if(!error) {
            // Get the Stripe token:
            Stripe.createToken({
               number: ccNum,
               cvc: cvcNum,
               exp_month: expMonth,
               exp_year: expYear
            }, stripeResponseHandler);

        }
        return false;
    }); // form submission

    function stripeResponseHandler(status, response) {
      if (response.error) {
        alert(response.error.message);
      } else {
        // Get a reference to the form:
        var f = $("#tinito_form");

        // Get the token from the response:
        var token = response.id;


        // Add the token to the form:
        f.append('<input type="hidden" name="user[stripe_customer_token]" value="' + token + '"  />');

        // Submit the form
        f.get(0).submit();
      }
    }
});
