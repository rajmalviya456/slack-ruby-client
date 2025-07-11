# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Slack::Web::Api::Mixins::Conversations do
  subject(:conversations) do
    klass.new
  end

  let(:klass) do
    Class.new do
      include Slack::Web::Api::Mixins::Conversations
    end
  end

  before do
    allow(conversations).to receive(:conversations_list).and_yield(
      Slack::Messages::Message.new(
        'channels' => [{
          'id' => 'CDEADBEEF',
          'name' => 'general'
        }]
      )
    )
  end

  describe '#conversations_id' do
    it 'leaves channels specified by ID alone' do
      expect(conversations.conversations_id(channel: 'C123456')).to(
        eq('ok' => true, 'channel' => { 'id' => 'C123456' })
      )
    end

    it 'translates a channel that starts with a #' do
      expect(conversations).to receive(:conversations_list)
      expect(conversations.conversations_id(channel: '#general')).to(
        eq('ok' => true, 'channel' => { 'id' => 'CDEADBEEF' })
      )
    end

    it 'forwards a provided team_id to the underlying conversations_list calls' do
      expect(conversations).to receive(:conversations_list).with(team_id: 'T1234567890')
      conversations.conversations_id(channel: '#general', team_id: 'T1234567890')
    end

    it 'forwards a provided exclude_archived to the underlying conversations_list calls' do
      expect(conversations).to receive(:conversations_list).with(exclude_archived: true)
      conversations.conversations_id(channel: '#general', id_exclude_archived: true)
    end

    it 'forwards the provided limit to the underlying conversations_list calls' do
      expect(conversations).to receive(:conversations_list).with(limit: 1234)
      conversations.conversations_id(channel: '#general', id_limit: 1234)
    end

    it 'forwards a provided types to the underlying conversations_list calls' do
      expect(conversations).to receive(:conversations_list).with(types: 'public_channel,private_channel')
      conversations.conversations_id(channel: '#general', id_types: 'public_channel,private_channel')
    end

    it 'fails with an exception' do
      expect { conversations.conversations_id(channel: '#invalid') }.to(
        raise_error(Slack::Web::Api::Errors::SlackError, 'channel_not_found')
      )
    end

    context 'when a non-default conversations_id page size has been configured' do
      before { Slack::Web.config.conversations_id_page_size = 500 }

      after { Slack::Web.config.reset }

      it 'translates a channel that starts with a #' do
        expect(conversations).to receive(:conversations_list).with(limit: 500)
        expect(conversations.conversations_id(channel: '#general')).to(
          eq('ok' => true, 'channel' => { 'id' => 'CDEADBEEF' })
        )
      end

      it 'forwards a provided limit to the underlying conversations_list calls' do
        expect(conversations).to receive(:conversations_list).with(limit: 1234)
        conversations.conversations_id(channel: '#general', id_limit: 1234)
      end
    end
  end
end
