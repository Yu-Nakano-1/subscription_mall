# frozen_string_literal: true

class Owners::OmniauthCallbacksController < Devise::OmniauthCallbacksController
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

  def facebook_owner
    callback_from :facebook_owner
  end

  def twitter_owner
    callback_from :twitter_owner
  end

  def line_owner; basic_action end

  private

  def basic_action # line ログイン用メソッドです
    @omniauth = request.env['omniauth.auth']
    if @omniauth.present?
      @profile = Owner.where(provider: @omniauth['provider'], uid: @omniauth['uid']).first
      if @profile
        @profile.set_values(@omniauth)
        sign_in(:owner, @profile)
      else
        @profile = Owner.new(provider: @omniauth['provider'], uid: @omniauth['uid'])
        email = @omniauth['info']['email'] ? @omniauth['info']['email'] : "#{@omniauth['uid']}-#{@omniauth['provider']}@example.com"
        @profile = current_owner || Owner.create!(provider: @omniauth['provider'], uid: @omniauth['uid'], email: email, name: @omniauth['info']['name'], password: Devise.friendly_token[0, 20])
        @profile.set_values(@omniauth)
        sign_in(:owner, @profile)
        redirect_to owner_account_path(@profile.owner.id) and return
        OwnerMailer.with(owner: @owner).welcome_email.deliver_now
        OwnerMailer.with(owner: @owner).notice_owner_joining_email.deliver_now
      end
    end
    flash[:notice] = "ログインしました"
    redirect_to owner_path(@profile)
  end



  def callback_from(provider) # facebook, twitter ログイン用メソッドです
    provider = provider.to_s
    @owner = Owner.find_for_oauth(request.env['omniauth.auth'])
    if @owner.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
      sign_in_and_redirect @owner, event: :authentication
    else
      flash[:notice] = "既に別のSNSで登録されています"
      session["devise.#{provider}_data"] = request.env['omniauth.auth'].except("extra")
      redirect_to new_owner_registration_url
    end
  end
  
  def check_login
    if current_user || current_owner || current_admin
      flash[:danger] = "既にログインしています。別のユーザーとしてログインする場合は、一度ログアウトして下さい。"
      redirect_to root_url, notice: '既にログインしています。別のユーザーでログインする場合は、一度ログアウトして下さい。'
    end
  end

end
