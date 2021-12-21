# frozen_string_literal: true
# This file was auto-generated by lib/tasks/web.rake

module Slack
  module Web
    module Api
      module Endpoints
        module Migration
          #
          # For Enterprise Grid workspaces, map local user IDs to global user IDs
          #
          # @option options [array] :users
          #   A comma-separated list of user ids, up to 400 per request.
          # @option options [string] :team_id
          #   Specify team_id starts with T in case of Org Token.
          # @option options [boolean] :to_old
          #   Specify true to convert W global user IDs to workspace-specific U IDs. Defaults to false.
          # @see https://api.slack.com/methods/migration.exchange
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/migration/migration.exchange.json
          def migration_exchange(options = {})
            throw ArgumentError.new('Required arguments :users missing') if options[:users].nil?
            post('migration.exchange', options)
          end
        end
      end
    end
  end
end
