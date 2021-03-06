class OwnersController < ApplicationController
  before_action :set_owner, only: [:update_deleted_owners, :to_user_email, :new, :create, :show, :edit, :update, :destroy, :owner_edit, :owner_edit_update]
  # before_action :set_subscription, only: [:owner_account]
  before_action :login_current_owner, only: %i(edit owner_account)
  before_action :only_current_admin, only: %i(index)

  def index
    @owners = Owner.with_deleted.where(deleted_at: nil).paginate(page: params[:page], per_page: 20)
  end

  def deleted_owners#論理削除した経営者
    @owners = Owner.with_deleted.where.not(deleted_at: nil)
  end

  def update_deleted_owners#論理削除用のアクション
    @owner = Owner.with_deleted.restore
    redirect_to owners_url
  end

  def interviews_index
    # owner = Owner.find(params[:id])
    # @interviews = owner.interviews
  end

  def show
    if @subscriptions_count == 0
      @subscriptions_count = Subscription.find_by(owner_id: params[:id]) # 変更後
    else
      @subscriptions_count = Subscription.where.not(name: nil).size
    end
    @subscriptions_count = @owner.subscriptions.count
    @subscriptions = @owner.subscriptions.where(owner_id: @owner.id)
    @private_stores_count = @owner.private_stores.count
    @private_stores = @owner.private_stores.where(owner_id: @owner.id)  
  end

  def owner_account
    @owner = Owner.find(params[:id])
    @subscriptions_count = @owner.subscriptions.count
    @subscriptions = @owner.subscriptions.where(owner_id: @owner.id)
    @private_stores_count = @owner.private_stores.count
    @private_stores = @owner.private_stores.where(owner_id: @owner.id)  
  end

  def edit
  end

  def update
    if current_owner.update(owner_params)
      sign_in(current_owner, bypass: true)
      flash[:success] = "#{current_owner.name}様の情報を更新しました。"
      redirect_to owner_account_owner_url(current_owner.id), notice: "更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @owner.soft_delete
    Devise.sign_out_all_scopes ? sign_out : sign_out(@owner)
    yield @owner if block_given?
    flash[:danger] = "#{@owner.name}様のデータを削除しました"
    redirect_to owners_url, notice: "削除しました。"
  end

  # オーナーの名前をあいまい検索機能
  def search
    if params[:name].present?
      @owners = Owner.where('name LIKE ?', "%#{params[:name]}%")
    else
      @owners = Owner.none
    end
  end

  def participating_private_select
  end

  def private_store_ticket_buyer_list
    @private_store_ticket_buyer_list =   []
    private_stores = PrivateStore.where(owner_id: params[:owners])
    private_stores.each {|private_store|
      users =  User.where.not(issue_ticket_day: nil).where.not(private_store_id: nil).where(use_ticket_day: nil)
      users.each {|user|
        @private_store_ticket_buyer_list.push(user) if user.private_store_id == private_store.id
      }
    }
  end

  private

    def set_owner
      @owner = Owner.find(params[:id])
    end
    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    def owner_params
      params.require(:owner).permit(:name, :kana, :email, :phone_number, :address)
    end

    def user_params
      params.require(:user).params(:name, :email, :subject, :message)
    end

    def email_params
      params.require(:user).permit(owner: [:name, :email])
    end
end
