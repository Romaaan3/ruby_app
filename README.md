# Task
1. Write a ruby script that (ruby_app):    
    * a. Receives a log as argument (webserver.log is provided) e.g.: ./parser.rb webserver.log’
    * b. Returns the following:
        * list of webpages with most page views ordered from most pages views to less page views e.g.:
            * `/home 90 visits /index 80 visits etc...` 
        * list of webpages with most unique page views also ordered e.g.:
            * `/about/2 8 unique views /index 5 unique views etc...`

    Run:
     * Result `ruby parser.rb webserver.log`
     * Tests `rspec`
     
     
     
# Result
```
Most views:
/about/2 90 visits
/contact 89 visits
/index 82 visits
/about 81 visits
/help_page/1 80 visits
/home 78 visits
Most unique views:
/index 23 unique views
/home 23 unique views
/contact 23 unique views
/help_page/1 23 unique views
/about/2 22 unique views
/about 21 unique views
```
# TODO
* Add more unit tests
* Add more static code analyzing tools
* Add simpleCov
* Add statistics per IP

# Code analysis
## Rubocop

Run in cmd: `rubocop`

Result: `13 files inspected, no offenses detected`
