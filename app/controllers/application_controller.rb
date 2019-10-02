class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 
  before_action :configure_permitted_parameters, if: :devise_controller? #デバイスに関する画面で機能する

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:image])  #元々の機能にはメアドとパスワードしか設定されていないため新しいキーを追加する時にこれを使う
  end
end
