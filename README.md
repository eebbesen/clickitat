# Clickitat
<img src="http://www.museumofthecity.org/wp-content/uploads/2013/05/Klickitat-Street-Sign.jpg" width="300px" alt="Klickitat street sign">

Lightweight application that clicks the links in an email message given the subject of said email.

### Note
* Works only with GMail accounts
* Clickitat is _not_ secure -- I recommended that you use Clickitat only with test gmail accounts
* Clickitat will open the links for the first email it finds, so unique subjects are encouraged

## Quick start example
1. Pick a GMail account to use.  We'll use clicki.example@gmail.com with password `6adpas5W0rd`for this example.
1. Send an email with links in it to clicki.example@gmail.com.  We'll use one with a subject of `ClickitatEmailWithLinks`.
1. Create an API key.  We'll use `ABCD1234` for this example.  You should use one with more entropy.
1. Create file config/config.local.yml with `clicki.example: 6adpas5W0rd`
1. `bundle install` in the clickitat directory
1. `export clickitat_api=<your_api_key>`
1. `bundle exec rackup` in the clickitat directory
1. `curl -vvv -H "Authorization: ABCD1234" 'http://localhost:9292/openclick?username=clicki.example&subject=ClickitatEmailWithLinks' >> output.html`
1. `open output.html`

## Configuration
This application only supports one API key
* `ENV['clickitat_api']` is compared to the `Authorization` header passed in by the client

## Run locally

    bundle install
    clickitat_api=<your_api_key> bundle exec rackup

Application available at http://localhost:9292

## Calling clickitat
### cURL

    curl -vvv -H "Authorization: <your_api_key>" 'http://localhost:9292/openclick?username=<gmail_local-part>&subject=<email_subject>'


### About
Built with [cuba_genie](http://www.rubydoc.info/gems/cuba_genie)