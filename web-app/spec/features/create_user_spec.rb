require 'rails_helper'

module UserAdmin

  context "User module" do
    
    it "navbar content" do
      visit new_user_path
      find('#submit_btn', :visible => false).click
    end

  end
end

