require_dependency 'repositories_controller'

class RepositoryIssuesController < RepositoriesController

  def issues
    per_page = params[:per_page].to_i
    per_page = 20 if per_page < 1

    page = params[:page].to_i
    page = 1 if page < 1

    query = Issue.joins(:changesets => :filechanges)
      .where('changes.path' => '/' + @path, :closed_on => nil)
      .order('committed_on DESC')
      .select('issues.id').uniq

    @count = query.count

    @pages = Paginator.new @count, per_page, page

    ids = query.map(&:id).slice(@pages.offset, per_page)

    @issues = Issue.includes(:status, :assigned_to, :project, :custom_values)
      .where(:id => ids)

  end

end
