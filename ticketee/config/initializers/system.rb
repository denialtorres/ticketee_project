Dry::Rails.container do
  config.features = %i[application_contract]
  auto_register!('lib')

  register(:project_repo, -> { ProjectRepository.new(ROM.env) })
  register(:create_project, -> { Projects::Create.new })
  register(:user_repo, -> { UserRepository.new(ROM.env) } )
end
