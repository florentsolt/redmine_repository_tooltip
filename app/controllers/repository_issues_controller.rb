require_dependency 'repositories_controller'

class RepositoryIssuesController < RepositoriesController

  def issues
    per_page = params[:per_page].to_i
    per_page = 20 if per_page < 1

    page = params[:page].to_i
    page = 1 if page < 1

    @count = Issue.count
    @pages = Paginator.new @count, per_page, page

    @issues = Issue.limit(per_page).offset(@pages.offset)
    @issues = Change.joins(:changeset => :issues).where(:path => '/' + @path).order('committed_on DESC').limit(per_page).offset(@pages.offset).map(&:changeset).map(&:issues).flatten.uniq
  end

end
