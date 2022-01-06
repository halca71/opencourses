class ApplicationController < ActionController::Base
  include SessionsHelper
  include AdloginHelper
  include Pagy::Backend
  
  private

end
