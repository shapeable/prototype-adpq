require 'rails_helper'
require_relative '../../app/helpers/application_helper'

module TestApplicationHelper

  context "Helper module" do
    it "get_lenguages" do
      expect(ApplicationHelper.get_lenguages).to include("English","Spanish")
       expect(ApplicationHelper.get_lenguages.length).to be(2)
    end
    
    it "get_years" do
      expect(ApplicationHelper.get_years.length).to be>=10
    end
  end
end