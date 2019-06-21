# frozen_string_literal: true

require 'rails_helper'
require 'graphql_helper'

RSpec.describe 'Login mutation', type: :feature do
  let(:graphql) { GraphqlHelper.new }
  let(:results) { graphql.login(input: input) }
  let(:data)    { results['data']['login'] }
  let(:errors)  { results['errors'] }

  describe 'when passing invalid arguments' do
    let(:input) { {} }

    it 'returns nil for a token' do
      expect(data['token']).to eq(nil)
    end

    it 'does not return top level errors' do
      expect(errors).to eq(nil)
    end

    it 'returns errors as data' do
      expect(data['errors']).not_to be_empty
    end
  end

  describe 'when passing valid arguments' do
    let(:input) { { login: login, password: password } }

    describe 'when the credentials are valid' do
      let(:user)     { create :random_user }
      let(:login)    { user.login }
      let(:password) { user.password }

      it 'returns a token' do
        expect(data['token']).not_to eq(nil)
      end

      it 'does not return top level errors' do
        expect(errors).to eq(nil)
      end

      it 'does not return errors as data' do
        expect(data['errors']).to be_empty
      end
    end

    describe 'when the credentials are invalid' do
      let(:login)    { Faker::Name.unique.first_name }
      let(:password) { Faker::Internet.password }

      it 'returns nil for a token' do
        expect(data['token']).to eq(nil)
      end

      it 'does not return top level errors' do
        expect(errors).to eq(nil)
      end

      it 'returns errors as data' do
        expect(data['errors']).not_to be_empty
      end
    end
  end
end
