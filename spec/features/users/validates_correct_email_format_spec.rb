require "validates_email_format_of/rspec_matcher"
require 'rails_helper'


  describe User do
    it { should validate_email_format_of(:email).with_message('is not looking good') }
  end