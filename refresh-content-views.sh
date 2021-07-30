#!/bin/bash
# This script will sync a list of repositories and then publish content using a list of content-views.
# If this script is dropped into cron, it will result in activation-key(s) associated with content-views
# being sync'd whenever the script is executed by crontab.

repository_list=( 1 2 3 4 5 6 7 8 9 10 )
contentview_list=( 20 21 22 23 )



function synchronize_repos {
for repository_id in "${repository_list[@]}"
do
      hammer repository sync --id=${repository_id}
done
}

function publish_contentviews {

for contentview_id in "${contentview_list[@]}"
do
      hammer content-view publish --id=${contentview_id}
done
}


# Execute functions
# First synchronize the repositories
synchronize_repos

# Second publish the contentviews
publish_contentviews
