# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    # Users
    field :update_user, mutation: Mutations::UpdateUser
    field :destroy_user, mutation: Mutations::DestroyUser

    # User Sessions
    field :register, mutation: Mutations::Register
    field :login, mutation: Mutations::Login
  end
end
