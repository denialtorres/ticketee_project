class UserRepository < ROM::Repository::Root
  root :users

  commands :create, update: :by_pk, delete: :by_pk

  struct_namespace Users

  def by_id(id)
    root.by_pk(id).one
  end

  def all
    root.to_a
  end
end
