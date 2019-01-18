Rails.configuration.stripe = {
  publishable_key: 'pk_test_oD1YGj75qwNRy3zOGgA8Fbzv', #ENV['pk_test_oD1YGj75qwNRy3zOGgA8Fbzv'],
  secret_key:      'sk_test_QpagRDEvxZrbyVJvhn68Jiao' #ENV['sk_test_QpagRDEvxZrbyVJvhn68Jiao']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]