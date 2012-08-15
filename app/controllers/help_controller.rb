class HelpController < ApplicationController
  skip_before_filter :authorize
  def index
    @version = "2.0"
  end

end
