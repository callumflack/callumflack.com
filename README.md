# run localhost with unicorn

bundle exec unicorn -l 9000

# deployment

1. push to github
2. push to heroku via $ rake deploy or $ git push heroku master, whichever you prefer
