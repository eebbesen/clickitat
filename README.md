# Clickitat

Lightweight application that opens an email in GMail and clicks the links (including images)

## Configuration
This application only supports one API key
* `ENV['clickitat_api']` is compared to the `Authorization` header passed in by the client

## Run locally

    bundle install
    clickitat_api=<your_api_key> bundle exec rackup

Application available at http://localhost:9292

## Calling clickitat
### cURL

    curl -vvv -H "Authorization: <your_api_key>" 'http://localhost:9292/openclick?username=<gmail_local-part>&subject=<email_message_subject>'


### About
Built with [cuba_genie](http://www.rubydoc.info/gems/cuba_genie)