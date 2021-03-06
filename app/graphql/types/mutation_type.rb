# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    # Users (non-admin)
    field :update_me, mutation: Mutations::UpdateMe
    field :destroy_me, mutation: Mutations::DestroyMe

    # Users (admin)
    field :update_user, mutation: Mutations::UpdateUser
    field :destroy_user, mutation: Mutations::DestroyUser

    # User sessions
    field :register, mutation: Mutations::Register
    field :login, mutation: Mutations::Login

    # Projects
    field :create_project, mutation: Mutations::CreateProject
    field :update_project, mutation: Mutations::UpdateProject

    # Direct upload
    field :create_direct_upload, mutation: Mutations::CreateDirectUpload
  end
end
