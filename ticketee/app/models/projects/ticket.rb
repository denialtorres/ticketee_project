module Projects
  class Ticket < ApplicationModel
    attribute :id, Types::Integer
    attribute :title, Types::String
    attribute :comment, Types::String
    attribute :project_id, Types::Integer
  end
end
