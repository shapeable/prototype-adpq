require 'rails_helper'

module DashboardCenter

  context "Dashboard module" do

    it "exist" do
      visit root_path
      find('#nav_government', :visible => false).click
      expect(page).to have_content I18n.t('dashboard.title') 

    end

    it "has two menus" do
      visit alarms_path
      find('#link_dashboard_overview', :visible => false).click
      expect(page).to have_content I18n.t('dashboard.title') 
      find('#link_dashboard_alerts', :visible => false).click
      expect(page).to have_content I18n.t('alert.title') 

    end

    it "can send alarm" , js: true do
      visit alarms_path
      find('#link_dashboard_alerts', :visible => false).click
      find('#submit_btn', :visible => false).click
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content I18n.t('alert.error')

    end

    it "can create new alarm" do
      visit alarms_path
      find('#link_dashboard_alerts', :visible => false).click
      find('#new_alarm_button', :visible => false).click
      expect(page).to have_content I18n.t('alert.form.name') 
    end

  end
end
