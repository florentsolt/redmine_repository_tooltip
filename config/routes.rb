# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

get 'projects/:id/repository/:repository_id/issues(/*path(.:ext))',
    :controller => 'repository_issues',
    :action => 'issues'

get 'projects/:id/repository/:issues(/*path(.:ext))',
    :controller => 'repository_issues',
    :action => 'issues'
