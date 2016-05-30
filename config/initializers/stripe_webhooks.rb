StripeEvent.configure do |events|
  
  events.subscribe 'customer.subscription.deleted' do |event|
    ap 'customer.subscription.deleted'
    ap event
    subscription = event.data.object
    customer_id = subscription.customer
    
    account = Account.find_by_customer_id(customer_id)
    account.stripe_plan_id = ''
    
    account.active_until = Time.at(0).to_datetime
    account.save!
  end
  
  events.subscribe 'customer.subscription.updated' do |event|
    ap 'customer.subscription.updated'
    ap event
    
    subscription = event.data.object
    customer_id = subscription.customer
    account = Account.find_by_customer_id(customer_id)
    account.stripe_plan_id = subscription.plan.id
    
    account.active_until = Time.at(subscription.current_period_end).to_datetime
    account.save!
  end
  
  # events.subscribe 'charge.failed' do |event|
  #   # Define subscriber behavior based on the event object
  #   event.class       #=> Stripe::Event
  #   event.type        #=> "charge.failed"
  #   event.data.object #=> #<Stripe::Charge:0x3fcb34c115f8>
  # end

  # events.all do |event|
  #   # Handle all event types - logging, etc.
  # end
end