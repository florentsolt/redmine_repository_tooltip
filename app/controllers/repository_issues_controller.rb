require_dependency 'repositories_controller'

class RepositoryIssuesController < RepositoriesController

  def issues
    per_page = params[:per_page].to_i
    per_page = 20 if per_page < 1

    page = params[:page].to_i
    page = 1 if page < 1

    query = Change.joins(:changeset => :issues)
      .where(:path => '/' + @path, 'issues.closed_on' => nil)
      .order('committed_on DESC')
    @count = query.count
    @pages = Paginator.new @count, per_page, page
    @issues = query.limit(per_page).offset(@pages.offset).map(&:changeset).map(&:issues).flatten.uniq
  end

end
