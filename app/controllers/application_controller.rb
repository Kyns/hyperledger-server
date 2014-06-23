class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  
private
  
  def confirmation_params
    params.fetch(:confirmation, {}).permit(:server, :signature)
  end
  
  def confirmed?
    return false if confirmation_params.empty?
    server_id = confirmation_params[:server]
    signature = confirmation_params[:signature]
    ConsensusPool.instance.valid_confirmation?(server_id, signature, {ledger: ledger_params, primary_account: primary_account_params)
  end
  
end
