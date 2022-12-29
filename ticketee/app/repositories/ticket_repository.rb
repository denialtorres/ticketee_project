class TicketRepository < ROM::Repository::Root
  root :tickets

  commands :create, update: :by_pk, delete: :by_pk

  # the struct_namespace call here will make the repository try to find a class called
  # Projects::Ticket to use to represent data from this repository
  struct_namespace Projects

  def by_id(id)
    root.by_pk(id).one
  end

  def all
    root.to_a
  end
end
