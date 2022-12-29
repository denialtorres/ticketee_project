module Users
  class User < ApplicationModel
    attribute :id, Types::Integer
    attribute :username, Types::String
  end
end
