# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :check_login, only: [:facebook, :twitter, :line]

 
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end

 def facebook
    callback_from :facebook
 end

  def twitter
    callback_from :twitter
  end

  def line; basic_action end


  private

    def basic_action # line ログイン用メソッドです
      @omniauth = request.env['omniauth.auth']
      if @omniauth.present?
        @profile = User.where(provider: @omniauth['provider'], uid: @omniauth['uid']).first
        if @profile
          @profile.set_values(@omniauth)
          sign_in(:user, @profile)
        else
          @profile = User.new(provider: @omniauth['provider'], uid: @omniauth['uid'])
          email = @omniauth['info']['email'] ? @omniauth['info']['email'] : "#{@omniauth['uid']}-#{@omniauth['provider']}@example.com"
          @profile = current_user || User.create!(provider: @omniauth['provider'], uid: @omniauth['uid'], email: email, name: @omniauth['info']['name'], password: Devise.friendly_token[0, 20])
          @profile.set_values(@omniauth)
          sign_in(:user, @profile)
          # redirect_to user_account_path(@profile.user.id) and return
          redirect_to root_url and return
          UserMailer.with(user: @user).welcome_email.deliver_now
          UserMailer.with(user: @user).notice_user_joining_email.deliver_now # adminへ通知メール
        end
        flash[:notice] = "ログインしました"
        redirect_to root_url
      end
    end

    # 元々omniauth_callback_controller.rbにあるメッソド def callback_from(provider) # facebook, twitter ログイン用メソッドです
    def callback_from(provider) # facebook, twitter ログイン用メソッドです
      provider = provider.to_s
      @user = User.find_for_oauth(request.env['omniauth.auth'])
      if @user.persisted?
        flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
        sign_in_and_redirect @user, event: :authentication
      else
        flash[:notice] = "既に別のSNSで登録されています"
        session["devise.#{provider}_data"] = request.env['omniauth.auth'].except("extra")
        redirect_to new_user_session_url
      end
    end

    def check_login
      if current_user || current_owner || current_admin
        flash[:danger] = "既にログインしています。別のユーザーとしてログインする場合は、一度ログアウトして下さい。"
        redirect_to root_url, notice: '既にログインしています。別のユーザーでログインする場合は、一度ログアウトして下さい。'
      end
    end
  
end
