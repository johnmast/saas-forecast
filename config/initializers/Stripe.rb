Rails.configuration.stripe = {
  :publishable_key => "pk_test_OilF7EMqGMw8b4I3QnXReUqW",
  :secret_key => "sk_test_AS3TKysspkcioahi3clmwkoq"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]