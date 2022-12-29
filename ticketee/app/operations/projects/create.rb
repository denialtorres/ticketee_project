module Projects
  class Create
    include Dry::Monads[:result]
    include Dry::Monads::Do.for(:call)

    def call(input)
      params = yield validate(input)
      persist(params.to_h)
    end

    def validate(input)
      ProjectContract.new.call(input).to_monad
    end

    def persist(input)
      project = project_repo.create(input)

      Success(project)
    end

    private

    def project_repo
      ProjectRepository.new(ROM.env)
    end
  end
end
