module PlanManager
    #Get the current plan of the user
    def current_plan
        account = current_account

        plan_id = account.stripe_plan_id

        if plan_id.nil?
            return nil
        end

        plan = Plan.find_by_stripe_id (plan_id)

    end


    def current_account

        Account.find_by_email(current_user.email)

    end

    #Check whether user's plan allows current action
    def plan_check (action, subject)
        if current_plan.nil?
            check_no_plan_restrictions(action, subject)
        elsif current_plan.stripe_id == "free-plan"
            check_free_plan_restrictions(action, subject)
        else
            check_awesome_plan_restrictions(action, subject)
        end

    end

    def check_no_plan_restrictions (action, subject)
        if action == "create"
            if subject == "weather_grid"
                return "You need a plan to create WeatherGrid. Please visit <a href='/subscriptions'>Plans</a> to buy a plan"
            end
        end
    end

    def check_free_plan_restrictions(action, subject)
        if action == "create"
            if subject == "weather_grid"
                count = WeatherGrid.count

                if count >= 2
                    return "Your plan only allows 2 WeatherGrids. Please visit <a href='/subscriptions'>Plans</a> to buy a plan"
                end
                
            end
        end

    end

    def check_awesome_plan_restrictions (action, subject)
        if action == "create"
            if subject == "weather_grid"
                count = WeatherGrid.count

                if count >= 6
                    return "You need a plan to create WeatherGrid. Please visit <a href='/subscriptions'>Plans</a> to buy a plan"
                end
            end
        end
    end
end