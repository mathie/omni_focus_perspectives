# The base class from which all controllers inherit. Expect to find common
# extracted functionality pulled into here if it turns out there is any.
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
