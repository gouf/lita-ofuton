require "spec_helper"

# In development environment, adjust redis host/port setting if you using docker or whatever
# Lita.configure do |config|
#   config.redis[:host] = 'localhost'
#   config.redis[:port] = '6379'
# end

describe Lita::Handlers::Ofuton, lita_handler: true do
  let(:source) { ::Lita::Source.new(user: user) }
  let(:user) { ::Lita::User.create('U02FERE10', name: 'foo') }

  it 'response includes ｵｽﾄﾝ' do
    send_message('ofuton')
    expect(replies.join("\n")).to match('ｵｽﾄﾝ')
  end
end
