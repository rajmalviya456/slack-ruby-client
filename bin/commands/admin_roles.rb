# frozen_string_literal: true
# This file was auto-generated by lib/tasks/web.rake

module Slack
  module Cli
    class App
      desc 'AdminRoles methods.'
      command 'admin_roles' do |g|
        g.desc 'Adds members to the specified role with the specified scopes'
        g.long_desc %( Adds members to the specified role with the specified scopes )
        g.command 'addAssignments' do |c|
          c.flag 'entity_ids', desc: 'List of the entity IDs for which roles will be assigned. These can be Org IDs, Team IDs or Channel IDs.'
          c.flag 'role_id', desc: 'ID of the role to which users will be assigned.'
          c.flag 'user_ids', desc: 'List of IDs from the users to be added to the given role.'
          c.action do |_global_options, options, _args|
            puts JSON.dump(@client.admin_roles_addAssignments(options))
          end
        end

        g.desc 'Lists assignments for all roles across entities. Options to scope results by any combination of roles or entities'
        g.long_desc %( Lists assignments for all roles across entities. Options to scope results by any combination of roles or entities )
        g.command 'listAssignments' do |c|
          c.flag 'cursor', desc: 'Set cursor to next_cursor returned by the previous call to list items in the next page.'
          c.flag 'entity_ids', desc: 'The entities for which the roles apply.'
          c.flag 'limit', desc: 'The maximum number of items to return. Must be between 1 - 100 both inclusive.'
          c.flag 'role_ids', desc: 'collection of role ids to scope results by.'
          c.flag 'sort_dir', desc: 'Sort direction. Default is descending on date_create, can be either ASC or DESC.'
          c.action do |_global_options, options, _args|
            puts JSON.dump(@client.admin_roles_listAssignments(options))
          end
        end

        g.desc 'Removes a set of users from a role for the given scopes and entities'
        g.long_desc %( Removes a set of users from a role for the given scopes and entities )
        g.command 'removeAssignments' do |c|
          c.flag 'entity_ids', desc: 'List of the entity IDs for which roles will be revoked. These can be Org IDs, Team IDs or Channel IDs.'
          c.flag 'role_id', desc: 'ID of the role to which users will be assigned.'
          c.flag 'user_ids', desc: 'List of IDs of the users whose roles will be revoked.'
          c.action do |_global_options, options, _args|
            puts JSON.dump(@client.admin_roles_removeAssignments(options))
          end
        end
      end
    end
  end
end