$(function() {

	var updateRepositoryLinks = function() {
	  $('a.icon-file').each(function(i, a){
	  		a = $(a);
	  		if (a.attr('tooltip') === undefined) {
	  			var title = $('<div>');
	  			title.append($('<a>').attr('href', a.attr('href')).text('History'));
                title.append(' | ');
	  			title.append($('<a>').attr('href', a.attr('href').replace('/changes/', '/entry/')).text('View'));
                title.append(' | ');
	  			title.append($('<a>').attr('href', a.attr('href').replace('/changes/', '/annotate/')).text('Annotate'));
                title.append(' | ');
	  			title.append($('<a>').attr('href', a.attr('href').replace('/changes/', '/raw/')).text('Download'));
                title.append(' | ');
	  			title.append($('<a>').attr('href', a.attr('href').replace('/changes/', '/issues/')).text('Issues'));
	  			a.tooltipster({
	  				content: title,
                    contentCloning: false,
	  				contentAsHTML: true,
	  				interactive: true,
	  				position: 'right',
	  				theme: 'tooltipster-shadow',
                    onlyOne: true
	  			});
                a.attr('tooltip', 'true');
	  		}
	  });

      $('a.icon-folder').each(function(i, a){
            a = $(a);
            if (a.attr('tooltip') === undefined) {
                var title = $('<div>');
                title.append($('<a>').attr('href', a.attr('href')).text('View'));
                title.append(' | ');
                title.append($('<a>').attr('href', a.attr('href').replace('/show/', '/changes/')).text('History'));
                title.append(' | ');
                title.append($('<a>').attr('href', a.attr('href').replace('/show/', '/issues/')).text('Issues'));
                a.tooltipster({
                    content: title,
                    contentCloning: false,
                    contentAsHTML: true,
                    interactive: true,
                    position: 'right',
                    theme: 'tooltipster-shadow',
                    onlyOne: true
                });
                a.attr('tooltip', 'true');
            }
      });
	}

	// Add links on files when browsing repository
	if ($('body.controller-repositories.action-show').length) {
	  $(document).ajaxComplete(updateRepositoryLinks);
	  updateRepositoryLinks();
	}
});