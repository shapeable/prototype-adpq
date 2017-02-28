require 'rails_helper'

module NotificationCenter

  context "landing module" do
    
    it "navbar" do
      visit root_path
      expect(page).to have_content "California Alerts" 
    end
  end
end

