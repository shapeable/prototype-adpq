require 'rails_helper'

module Modal

  context "Modal module", js: true do
    
    it "can't create comment if it has't text" do
      visit root_path
      find('#modal_btn', :visible => false).click
      expect(page).to have_content I18n.t("landing.modal.title")
      find('#submit_btn', :visible => false).click
      expect(page).to have_content I18n.t('landing.modal.error')
    end

    it "can create comment if it has text" do
      visit root_path
      find('#modal_btn', :visible => false).click
      expect(page).to have_content I18n.t("landing.modal.title")
      fill_in "comment_description", with: "Volcanic Activity"
      find('#submit_btn', :visible => false).click
      expect(page).to have_content I18n.t('comment.created')
    end

  end
end

