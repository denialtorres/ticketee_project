# this repository class will let us perform queries on our database. It defines the root to be :projeccts,
# which will use the ProjectsRelation tha we generated just before 
class ProjectRepository < ROM::Repository::Root
  root :projects

  commands :create, update: :by_pk, delete: :by_pk

  struct_namespace Projects

  def by_id(id)
    root.by_pk(id).one
  end

  def all
    root.to_a
  end
end
