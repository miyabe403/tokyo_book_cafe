class ApplicationController < ActionController::Base
    private
  # サインイン後の遷移先を設定 
  def after_sign_in_path_for(resource_or_scope)
      # resource_or_scope という引数に Admin (管理者)のインスタンス格納されている場合の処理
      if resource_or_scope.is_a?(Admin)
          root_path #admins_orders_top_path 遷移先ページが実装されたら変更する
      else
          root_path #admins_orders_top_path 遷移先ページが実装されたら変更する
      end
  end
  
  # サインアウト後の遷移先を設定
  def
  after_sign_out_path_for(resource_or_scope)
      # resource_or_scope という引数に会員 or 管理者インスタンス格納されている場合の処理
      if resource_or_scope == :customer
          root_path
      elsif resource_or_scope == :admin
          new_admin_session_path
      else
          root_path
      end
  end

end
