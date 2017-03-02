require "spec_helper"
require_relative '../../app/helpers/application_helper'

module ApplicationHelper

  context "Helper module" do    
    it "get_years" do
      expect(get_years.length).to be>=10
    end
  end
end