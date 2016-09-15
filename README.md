Ps. This thing is now dead. Leaving it here for old times sake.

## run localhost with unicorn

bundle exec unicorn -l 9000
(-l 9000 to avoid a local printer conflict)

## deployment

1. push to github
2. push to heroku via $ rake deploy or $ git push heroku master, whichever you prefer
