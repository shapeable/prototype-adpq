Swagger::Docs::Config.register_apis({
  "1.0" => {:controller_base_path => "", :api_file_path => "public",
  :attributes => {
        :info => {
          "title" => "California Alerts",
          "description" => "The California alerts platform is a prototype that notify residents of different regions in California on emergencies happening near them. The platform is focused on two main users: The Government administrator and the californian resident. Government administrator user features include: a dashboard where the administrator may publish alerts, force alerts when needed, and analyze visually the generated notifications data. Resident user features include: Setting their preferences where he/she can choose how to be notified, on the alerts he/she wants to track or filling in a small survey to propose alerts of his/her interest.",
          "termsOfServiceUrl" => "http://california-alerts.shapeable.net",
          "contact" => "alan@shapeable,net",
          "license" => "MIT License",
          "licenseUrl" => "https://opensource.org/licenses/MIT"
        }
      }
    }
})