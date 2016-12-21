module Lita
  module Handlers
    class Ofuton < Handler
      route(/ofuton/, :ofuton)

      def ofuton(response)
        user_name = find_user_name(response.user&.id) rescue 'John Doe'
        ::Ofuton.in(user_name, hide_url: true).lines do |line|
          response.reply line
        end
      end

      def find_user_name(user_id)
        ::Slack.configure do |config|
          config.token = ENV['SLACK_API_TOKEN']
        end

        client = ::Slack::Web::Client.new
        user_info = client.users_info(user: user_id)
        user_info.dig(:user, :name)
      end
      Lita.register_handler(self)
    end
  end
end
