require 'rails_helper'

module UserAdmin

  context "User module", js: true do
    
    it "create user validations" do
      visit new_user_path
      find('#submit_btn', :visible => false).click
      expect(page).to have_content I18n.t('user.form.validations.not_settings')
    end

  end
end

