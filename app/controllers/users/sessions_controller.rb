
class Users::SessionsController < Devise::SessionsController
  prepend_before_action :check_captcha, only: [:create]

  private

  def check_captcha
    return if verify_recaptcha 

    self.resource = resource_class.new sign_in_params
    respond_with_navigational(resource) do
      flash.alert = "Recaptcha cannot be blank, please try again."
      render :new
    end
  end
end
