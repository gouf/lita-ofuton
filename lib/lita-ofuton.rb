require "lita"
require 'slack-ruby-client'
require_relative 'ofuton/shindan_scrape'
require_relative 'ofuton/ofuton'

Lita.load_locales Dir[File.expand_path(
  File.join("..", "..", "locales", "*.yml"), __FILE__
)]

require "lita/handlers/ofuton"

Lita::Handlers::Ofuton.template_root File.expand_path(
  File.join("..", "..", "templates"),
 __FILE__
)
