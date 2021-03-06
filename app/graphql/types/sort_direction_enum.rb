# frozen_string_literal: true

module Types
  class SortDirectionEnum < Types::BaseEnum
    value 'ASC', value: :asc, description: 'sort by ascending order'
    value 'DESC', value: :desc, description: 'sort by descending order'
  end
end
