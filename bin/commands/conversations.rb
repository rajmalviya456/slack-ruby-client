# frozen_string_literal: true
# This file was auto-generated by lib/tasks/web.rake

module Slack
  module Cli
    class App
      desc 'Conversations methods.'
      command 'conversations' do |g|
        g.desc 'Accepts an invitation to a Slack Connect channel.'
        g.long_desc %( Accepts an invitation to a Slack Connect channel. )
        g.command 'acceptSharedInvite' do |c|
          c.flag 'channel_name', desc: 'Name of the channel. If the channel does not exist already in your workspace, this name is the one that the channel will take.'
          c.flag 'channel_id', desc: "ID of the channel that you'd like to accept. Must provide either invite_id or channel_id."
          c.flag 'free_trial_accepted', desc: "Whether you'd like to use your workspace's free trial to begin using Slack Connect."
          c.flag 'invite_id', desc: "ID of the invite that you'd like to accept. Must provide either invite_id or channel_id. See the shared_channel_invite_received event payload for more details on how to retrieve the ID of the invitation."
          c.flag 'is_private', desc: 'Whether the channel should be private.'
          c.flag 'team_id', desc: 'The ID of the workspace to accept the channel in. If an org-level token is used to call this method, the team_id argument is required.'
          c.action do |_global_options, options, _args|
            puts JSON.dump(@client.conversations_acceptSharedInvite(options))
          end
        end

        g.desc 'Approves an invitation to a Slack Connect channel'
        g.long_desc %( Approves an invitation to a Slack Connect channel )
        g.command 'approveSharedInvite' do |c|
          c.flag 'invite_id', desc: 'ID of the shared channel invite to approve.'
          c.flag 'target_team', desc: 'The team or enterprise id of the other party involved in the invitation you are approving.'
          c.action do |_global_options, options, _args|
            puts JSON.dump(@client.conversations_approveSharedInvite(options))
          end
        end

        g.desc 'Archives a conversation.'
        g.long_desc %( Archives a conversation. )
        g.command 'archive' do |c|
          c.flag 'channel', desc: 'ID of conversation to archive.'
          c.action do |_global_options, options, _args|
            puts JSON.dump(@client.conversations_archive(options))
          end
        end

        g.desc 'Closes a direct message or multi-person direct message.'
        g.long_desc %( Closes a direct message or multi-person direct message. )
        g.command 'close' do |c|
          c.flag 'channel', desc: 'Conversation to close.'
          c.action do |_global_options, options, _args|
            puts JSON.dump(@client.conversations_close(options))
          end
        end

        g.desc 'Initiates a public or private channel-based conversation'
        g.long_desc %( Initiates a public or private channel-based conversation )
        g.command 'create' do |c|
          c.flag 'name', desc: 'Name of the public or private channel to create.'
          c.flag 'is_private', desc: 'Create a private channel instead of a public one.'
          c.flag 'team_id', desc: 'encoded team id to create the channel in, required if org token is used.'
          c.action do |_global_options, options, _args|
            puts JSON.dump(@client.conversations_create(options))
          end
        end

        g.desc 'Declines a Slack Connect channel invite.'
        g.long_desc %( Declines a Slack Connect channel invite. )
        g.command 'declineSharedInvite' do |c|
          c.flag 'invite_id', desc: 'ID of the Slack Connect invite to decline. Subscribe to the shared_channel_invite_accepted event to receive IDs of Slack Connect channel invites that have been accepted and are awaiting approval.'
          c.flag 'target_team', desc: 'The team or enterprise id of the other party involved in the invitation you are declining.'
          c.action do |_global_options, options, _args|
            puts JSON.dump(@client.conversations_declineSharedInvite(options))
          end
        end

        g.desc "Fetches a conversation's history of messages and events."
        g.long_desc %( Fetches a conversation's history of messages and events. )
        g.command 'history' do |c|
          c.flag 'channel', desc: 'Conversation ID to fetch history for.'
          c.flag 'cursor', desc: "Paginate through collections of data by setting the cursor parameter to a next_cursor attribute returned by a previous request's response_metadata. Default value fetches the first 'page' of the collection. See pagination for more detail."
          c.flag 'include_all_metadata', desc: 'Return all metadata associated with this message.'
          c.flag 'inclusive', desc: 'Include messages with oldest or latest timestamps in results. Ignored unless either timestamp is specified.'
          c.flag 'latest', desc: 'Only messages before this Unix timestamp will be included in results. Default is the current time.'
          c.flag 'limit', desc: "The maximum number of items to return. Fewer than the requested number of items may be returned, even if the end of the conversation history hasn't been reached. Maximum of 999."
          c.flag 'oldest', desc: 'Only messages after this Unix timestamp will be included in results.'
          c.action do |_global_options, options, _args|
            puts JSON.dump(@client.conversations_history(options))
          end
        end

        g.desc 'Retrieve information about a conversation.'
        g.long_desc %( Retrieve information about a conversation. )
        g.command 'info' do |c|
          c.flag 'channel', desc: 'Conversation ID to learn more about.'
          c.flag 'include_locale', desc: 'Set this to true to receive the locale for this conversation. Defaults to false.'
          c.flag 'include_num_members', desc: 'Set to true to include the member count for the specified conversation. Defaults to false.'
          c.action do |_global_options, options, _args|
            puts JSON.dump(@client.conversations_info(options))
          end
        end

        g.desc 'Invites users to a channel.'
        g.long_desc %( Invites users to a channel. )
        g.command 'invite' do |c|
          c.flag 'channel', desc: 'The ID of the public or private channel to invite user(s) to.'
          c.flag 'users', desc: 'A comma separated list of user IDs. Up to 1000 users may be listed.'
          c.flag 'force', desc: 'When set to true and multiple user IDs are provided, continue inviting the valid ones while disregarding invalid IDs. Defaults to false.'
          c.action do |_global_options, options, _args|
            puts JSON.dump(@client.conversations_invite(options))
          end
        end

        g.desc 'Sends an invitation to a Slack Connect channel'
        g.long_desc %( Sends an invitation to a Slack Connect channel )
        g.command 'inviteShared' do |c|
          c.flag 'channel', desc: "ID of the channel on your team that you'd like to share."
          c.flag 'emails', desc: 'Optional email to receive this invite. Either emails or user_ids must be provided. Only one email or one user ID may be invited at a time.'
          c.flag 'external_limited', desc: 'Optional boolean on whether invite is to an external limited member. Defaults to true.'
          c.flag 'user_ids', desc: 'Optional user_id to receive this invite. Either emails or user_ids must be provided. Only one email or one user ID may be invited at a time.'
          c.action do |_global_options, options, _args|
            puts JSON.dump(@client.conversations_inviteShared(options))
          end
        end

        g.desc 'Joins an existing conversation.'
        g.long_desc %( Joins an existing conversation. )
        g.command 'join' do |c|
          c.flag 'channel', desc: 'ID of conversation to join.'
          c.action do |_global_options, options, _args|
            puts JSON.dump(@client.conversations_join(options))
          end
        end

        g.desc 'Removes a user from a conversation.'
        g.long_desc %( Removes a user from a conversation. )
        g.command 'kick' do |c|
          c.flag 'channel', desc: 'ID of conversation to remove user from.'
          c.flag 'user', desc: 'User ID to be removed.'
          c.action do |_global_options, options, _args|
            puts JSON.dump(@client.conversations_kick(options))
          end
        end

        g.desc 'Leaves a conversation.'
        g.long_desc %( Leaves a conversation. )
        g.command 'leave' do |c|
          c.flag 'channel', desc: 'Conversation to leave.'
          c.action do |_global_options, options, _args|
            puts JSON.dump(@client.conversations_leave(options))
          end
        end

        g.desc 'Lists all channels in a Slack team.'
        g.long_desc %( Lists all channels in a Slack team. )
        g.command 'list' do |c|
          c.flag 'cursor', desc: "Paginate through collections of data by setting the cursor parameter to a next_cursor attribute returned by a previous request's response_metadata. Default value fetches the first 'page' of the collection. See pagination for more detail."
          c.flag 'exclude_archived', desc: 'Set to true to exclude archived channels from the list.'
          c.flag 'limit', desc: "The maximum number of items to return. Fewer than the requested number of items may be returned, even if the end of the list hasn't been reached. Must be an integer under 1000."
          c.flag 'team_id', desc: 'encoded team id to list channels in, required if token belongs to org-wide app.'
          c.flag 'types', desc: 'Mix and match channel types by providing a comma-separated list of any combination of public_channel, private_channel, mpim, im.'
          c.action do |_global_options, options, _args|
            puts JSON.dump(@client.conversations_list(options))
          end
        end

        g.desc 'Lists shared channel invites that have been generated or received but have not been approved by all parties'
        g.long_desc %( Lists shared channel invites that have been generated or received but have not been approved by all parties )
        g.command 'listConnectInvites' do |c|
          c.flag 'cursor', desc: 'Set to next_cursor returned by previous call to list items in subsequent page.'
          c.flag 'team_id', desc: 'Encoded team id for the workspace to retrieve invites for, required if org token is used.'
          c.action do |_global_options, options, _args|
            puts JSON.dump(@client.conversations_listConnectInvites(options))
          end
        end

        g.desc 'Sets the read cursor in a channel.'
        g.long_desc %( Sets the read cursor in a channel. )
        g.command 'mark' do |c|
          c.flag 'channel', desc: 'Channel or conversation to set the read cursor for.'
          c.flag 'ts', desc: 'Unique identifier of message you want marked as most recently seen in this conversation.'
          c.action do |_global_options, options, _args|
            puts JSON.dump(@client.conversations_mark(options))
          end
        end

        g.desc 'Retrieve members of a conversation.'
        g.long_desc %( Retrieve members of a conversation. )
        g.command 'members' do |c|
          c.flag 'channel', desc: 'ID of the conversation to retrieve members for.'
          c.flag 'cursor', desc: "Paginate through collections of data by setting the cursor parameter to a next_cursor attribute returned by a previous request's response_metadata. Default value fetches the first 'page' of the collection. See pagination for more detail."
          c.flag 'limit', desc: "The maximum number of items to return. Fewer than the requested number of items may be returned, even if the end of the users list hasn't been reached."
          c.action do |_global_options, options, _args|
            puts JSON.dump(@client.conversations_members(options))
          end
        end

        g.desc 'Opens or resumes a direct message or multi-person direct message.'
        g.long_desc %( Opens or resumes a direct message or multi-person direct message. )
        g.command 'open' do |c|
          c.flag 'channel', desc: "Resume a conversation by supplying an im or mpim's ID. Or provide the users field instead."
          c.flag 'prevent_creation', desc: 'Do not create a direct message or multi-person direct message. This is used to see if there is an existing dm or mpdm.'
          c.flag 'return_im', desc: 'Boolean, indicates you want the full IM channel definition in the response.'
          c.flag 'users', desc: 'Comma separated lists of users. If only one user is included, this creates a 1:1 DM.  The ordering of the users is preserved whenever a multi-person direct message is returned. Supply a channel when not supplying users.'
          c.action do |_global_options, options, _args|
            puts JSON.dump(@client.conversations_open(options))
          end
        end

        g.desc 'Renames a conversation.'
        g.long_desc %( Renames a conversation. )
        g.command 'rename' do |c|
          c.flag 'channel', desc: 'ID of conversation to rename.'
          c.flag 'name', desc: 'New name for conversation.'
          c.action do |_global_options, options, _args|
            puts JSON.dump(@client.conversations_rename(options))
          end
        end

        g.desc 'Retrieve a thread of messages posted to a conversation'
        g.long_desc %( Retrieve a thread of messages posted to a conversation )
        g.command 'replies' do |c|
          c.flag 'channel', desc: 'Conversation ID to fetch thread from.'
          c.flag 'ts', desc: "Unique identifier of either a thread's parent message or a message in the thread. ts must be the timestamp of an existing message with 0 or more replies. If there are no replies then just the single message referenced by ts will return - it is just an ordinary, unthreaded message."
          c.flag 'cursor', desc: "Paginate through collections of data by setting the cursor parameter to a next_cursor attribute returned by a previous request's response_metadata. Default value fetches the first 'page' of the collection. See pagination for more detail."
          c.flag 'include_all_metadata', desc: 'Return all metadata associated with this message.'
          c.flag 'inclusive', desc: 'Include messages with oldest or latest timestamps in results. Ignored unless either timestamp is specified.'
          c.flag 'latest', desc: 'Only messages before this Unix timestamp will be included in results.'
          c.flag 'limit', desc: "The maximum number of items to return. Fewer than the requested number of items may be returned, even if the end of the users list hasn't been reached."
          c.flag 'oldest', desc: 'Only messages after this Unix timestamp will be included in results.'
          c.action do |_global_options, options, _args|
            puts JSON.dump(@client.conversations_replies(options))
          end
        end

        g.desc 'Sets the channel description.'
        g.long_desc %( Sets the channel description. )
        g.command 'setPurpose' do |c|
          c.flag 'channel', desc: 'Channel to set the description of.'
          c.flag 'purpose', desc: 'The description.'
          c.action do |_global_options, options, _args|
            puts JSON.dump(@client.conversations_setPurpose(options))
          end
        end

        g.desc 'Sets the topic for a conversation.'
        g.long_desc %( Sets the topic for a conversation. )
        g.command 'setTopic' do |c|
          c.flag 'channel', desc: 'Conversation to set the topic of.'
          c.flag 'topic', desc: 'The new topic string. Does not support formatting or linkification.'
          c.action do |_global_options, options, _args|
            puts JSON.dump(@client.conversations_setTopic(options))
          end
        end

        g.desc 'Reverses conversation archival.'
        g.long_desc %( Reverses conversation archival. )
        g.command 'unarchive' do |c|
          c.flag 'channel', desc: 'ID of conversation to unarchive.'
          c.action do |_global_options, options, _args|
            puts JSON.dump(@client.conversations_unarchive(options))
          end
        end
      end
    end
  end
end
