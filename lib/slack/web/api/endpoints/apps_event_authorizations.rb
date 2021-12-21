# frozen_string_literal: true
# This file was auto-generated by lib/tasks/web.rake

module Slack
  module Web
    module Api
      module Endpoints
        module AppsEventAuthorizations
          #
          # Get a list of authorizations for the given event context. Each authorization represents an app installation that the event is visible to.
          #
          # @option options [string] :event_context
          #   .
          # @option options [string] :cursor
          #   .
          # @option options [integer] :limit
          #   .
          # @see https://api.slack.com/methods/apps.event.authorizations.list
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/apps.event.authorizations/apps.event.authorizations.list.json
          def apps_event_authorizations_list(options = {})
            throw ArgumentError.new('Required arguments :event_context missing') if options[:event_context].nil?
            if block_given?
              Pagination::Cursor.new(self, :apps_event_authorizations_list, options).each do |page|
                yield page
              end
            else
              post('apps.event.authorizations.list', options)
            end
          end
        end
      end
    end
  end
end
