require 'rails/all'
require 'sidekiq/testing'
require_relative '../../app/workers/api_general_hazards'
Sidekiq::Testing.fake!

module TestApiGeneralHazards
  context "General module" do
    let(:worker) {ApiGeneralHazards.new}
   
    it "read apis hazards" do
      worker.perform(0, "Hello World")
    end
  end
end
