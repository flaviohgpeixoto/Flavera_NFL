# frozen_string_literal: true

##
# Master Model
#
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
