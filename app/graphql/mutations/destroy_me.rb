# frozen_string_literal: true

module Mutations
  class DestroyMe < Mutations::BaseMutation
    null true

    field :success, Boolean, null: true
    field :errors, [Types::UserErrorType], null: false

    def ready?(**_args)
      require_login(on_error: { success: false })
    end

    def resolve
      context[:current_user].destroy

      {
        success: true,
        errors: []
      }
    end
  end
end
