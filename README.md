## BytesizeURL


BytesizeURL is a web application that generates shortened URLs.  A [deployed sample application](https://bytesizeurl.herokuapp.com/) is available.

### How it works
####Providing the shortened URL
When a HTTP-based URL is submitted to the application, it first checks whether that URL already exists in the database.  If it does, the user is provided with the associated shortened URL.  If the URL does not exist, the application uses an algorithm to generate the shortest possible available path.  This shortened URL is then stored in the database alongside the original URL and the shortened URL is returned to the user.

####Redirecting to full-length URL
All incoming requests to the application server are "screened" against an indexed column of shortened URLs (except for requests that relate to the user interface).  If a path in the database matches the path being requested by the user's browser, the application will issue a redirect to the user’s browser telling it to request the full-length URL. The browser will then send a new request to that URL.

### Installation
Make sure you have Ruby 2.3 and Postgres installed in your environment.  This is a Rails 4.2 app and uses bundler to install all required gems.  

* Clone the repository to your local development environment
* Install dependencies with `bundle install`
* Create a `database.yml` file and provide your Postgres credentials
* Setup your databases by running `rake db:setup`

### Testing
Rspec is utilized as the testing framework.  To run the entire test suite, run `rspec` from the CLI.

### Deployment
This app was written with a Heroku deployment stack in mind. However, you can deploy it anywhere assuming you can run Ruby 2.3.0 and Rails 4.2.4 with a Postgres database.

###Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/perrycarbone/bytesizeurl.

###License

The software is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
