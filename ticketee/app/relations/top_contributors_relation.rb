class TopContributorsRelation < ROM::Relation[:sql]
  gateway :default

  schema(:top_contributors, infer: true)

  # using map_to here tells ROM to cast the results of this query into objects
  def for_project(project_id, lowest_rank)
    where(project_id: project_id)
    .where { rank <= lowest_rank }
    .map_to(Projects::Contributor)
  end
end
