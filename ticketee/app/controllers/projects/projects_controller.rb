module Projects
  class ProjectsController < ApplicationController
    include Dry::Monads[:result]
    include Ticketee::Deps[repo: :project_repo]
    include Ticketee::Deps[:create_project]

    def index
      @projects = repo.all
    end

    def new
      @project = Projects::Project.new
    end

    def create
      case create_project.call(project_params)
        in Success(project)
          flash[:notice] = "Project has been created."
          redirect_to project

        in Failure(result)
          @project = Projects::Project.new(project_params)
          @errors = result.errors
          flash[:alert] = "Project could not be created."
          render :new
      end
    end

    def show
      # the by_id method works identically to the find method
      @project = repo.by_id(params[:id])
    end

    private

    def project_params
      params.require(:project).permit(:name).to_h.symbolize_keys
    end
  end
end
