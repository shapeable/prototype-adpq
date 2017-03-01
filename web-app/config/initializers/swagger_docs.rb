Swagger::Docs::Config.register_apis({
  "1.0" => {:controller_base_path => "", :api_file_path => "public",
  :attributes => {
        :info => {
          "title" => "California Alerts",
          "description" => "This is a sample description.",
          "termsOfServiceUrl" => "http://helloreverb.com/terms/",
          "contact" => "apiteam@wordnik.com",
          "license" => "Apache 2.0",
          "licenseUrl" => "http://www.apache.org/licenses/LICENSE-2.0.html"
        }
      }
    }
})