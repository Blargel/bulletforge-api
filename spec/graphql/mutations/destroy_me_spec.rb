# frozen_string_literal: true

require 'rails_helper'
require 'graphql_helper'

RSpec.describe 'DestroyMe mutation', type: :feature do
  let(:graphql)  { GraphqlHelper.new }
  let(:raw_data) { graphql.destroy_me(context: context) }
  let(:data)     { raw_data['data'] }
  let(:errors)   { raw_data['errors'] }
  let(:results)  { data['destroyMe'] }

  describe 'with no current user' do
    let(:context) { {} }

    it 'returns false on success' do
      expect(results['success']).to eq(false)
    end

    it 'does not return top level errors' do
      expect(errors).to eq(nil)
    end

    it 'returns errors as data' do
      expect(results['errors']).not_to be_empty
    end
  end

  describe 'with a current user' do
    let(:current_user) { create :random_user }
    let(:context)      { { current_user_id: current_user.id } }

    it 'destroys the user' do
      # Trigger lazy resolution
      raw_data
      expect { User.find(current_user.id) }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it 'returns success' do
      expect(results['success']).to eq(true)
    end

    it 'does not return top level errors' do
      expect(errors).to eq(nil)
    end

    it 'does not return errors as data' do
      expect(results['errors']).to be_empty
    end
  end
end
