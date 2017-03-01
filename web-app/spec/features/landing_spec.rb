require 'rails_helper'

module LandingCenter

  context "landing module" do
    
    it "navbar content" do
      visit root_path
      expect(page).to have_content I18n.t('navbar.residents')
      expect(page).to have_content I18n.t('navbar.government')
      expect(page).to have_content I18n.t('navbar.About')
      expect(page).to have_content "EN ES"
    end

    it "can visit create user" do
      visit root_path
      find('#create_user_btn', :visible => false).click
      expect(page).to have_content I18n.t('user.form.title')
    end
  end
end

