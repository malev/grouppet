class SessionsController < Clearance::SessionsController
  
  def destroy
    sign_out
    flash_success_after_destroy
    redirect_to(url_after_destroy)
  end

private

  def url_after_destroy
    snippets_path
  end
end
