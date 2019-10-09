# frozen_string_literal: true

##
# Master controller which one include policies by Pundit and DeviseTokenAuth for all controllers
#
class ApplicationController < ActionController::API
  include Pundit
  include DeviseTokenAuth::Concerns::SetUserByToken
end
