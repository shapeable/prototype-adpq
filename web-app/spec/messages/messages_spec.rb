require 'rails/all'
require_relative '../../app/modules/messages_module'

module MessagesModule
    MessagesModule.number_cel_from = '+17066230189'
  class TestClient
  end

  context "Message module" do

    it "send sms message" do
      number = "+525530265963"
      msg = "Hello World"
      client = TestClient.new
      allow(MessagesModule).to receive(:twilio_connection) { client }
      allow(client).to receive(:create).with(hash_including(from: '+17066230189', to: number, body: msg)){sms_response}
      expect(client).to receive(:create).with(hash_including(from: '+17066230189', to: number, body: msg))
      MessagesModule.send_SMS_message(number,msg)
    end

    def sms_response
        '{
            "sid": "SMc728c48b3ad54e28bd0e28b94fd60cd6",
            "date_created": "Wed, 22 Feb 2017 16:40:36 +0000",
            "date_updated": "Wed, 22 Feb 2017 16:40:36 +0000",
            "date_sent": null,
            "account_sid": "ACa392a3db6ddfec3e4c634c3b80a937a4",
            "to": "+525530265963",
            "from": "+17066230189",
            "messaging_service_sid": null,
            "body": "Sent from your Twilio trial account - Hello World",
            "status": "queued",
            "num_segments": "1",
            "num_media": "0",
            "direction": "outbound-api",
            "api_version": "2010-04-01",
            "price": null,
            "price_unit": "USD",
            "error_code": null,
            "error_message": null,
            "uri": "/2010-04-01/Accounts/ACa392a3db6ddfec3e4c634c3b80a937a4/Messages/SMc728c48b3ad54e28bd0e28b94fd60cd6.json",
            "subresource_uris": {
                "media": "/2010-04-01/Accounts/ACa392a3db6ddfec3e4c634c3b80a937a4/Messages/SMc728c48b3ad54e28bd0e28b94fd60cd6/Media.json"
            }
        }'
    end
  end
end