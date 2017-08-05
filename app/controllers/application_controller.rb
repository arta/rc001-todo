class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :better_errors_hack, if: -> { Rails.env.development? }

  private
    # 8-5-17: Speed up extremely slow better_errors & binding_of_caller gems
    # https://github.com/charliesome/better_errors/issues/341
    def better_errors_hack
      request.env['puma.config'].options.user_options.delete :app
    end
end
