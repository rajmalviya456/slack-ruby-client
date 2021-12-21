# frozen_string_literal: true
# This file was auto-generated by lib/tasks/web.rake

module Slack
  module Web
    module Api
      module Endpoints
        module Apps
          #
          # Uninstalls your app from a workspace.
          #
          # @option options [string] :client_id
          #   Issued when you created your application.
          # @option options [string] :client_secret
          #   Issued when you created your application.
          # @see https://api.slack.com/methods/apps.uninstall
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/apps/apps.uninstall.json
          def apps_uninstall(options = {})
            throw ArgumentError.new('Required arguments :client_id missing') if options[:client_id].nil?
            throw ArgumentError.new('Required arguments :client_secret missing') if options[:client_secret].nil?
            post('apps.uninstall', options)
          end
        end
      end
    end
  end
end
