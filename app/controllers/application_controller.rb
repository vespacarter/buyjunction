class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  #protected
  def after_sign_in_path_for(resource)
    profile_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
    devise_parameter_sanitizer.for(:account_update) << :fullname
    devise_parameter_sanitizer.for(:account_update) << :address
    devise_parameter_sanitizer.for(:account_update) << :city
    devise_parameter_sanitizer.for(:account_update) << :state
    devise_parameter_sanitizer.for(:account_update) << :zipcode
    devise_parameter_sanitizer.for(:account_update) << :avatar
  end


  def check_for_finished_items
    items = Item.all
    time = Time.now
    date = Date.today
    items.each do |item|
      if (item.expiration_date <= date) &&  (item.expiration_time) >= time
        item.open_to_apply = false
        if (item.min_units >= item.number_of_buyers)
            item.open_to_pay = true
        else
          item.all_sent = true
        end
      end
    end
  end
end



