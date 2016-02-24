require 'net/http'
require 'sinatra'
require 'json'
require 'uri'

CONTEXT = "force-pr"

GITHUB_ROOT = "https://api.github.com"
HEADERS = {
  'Content-Type' => 'text/json',
  'Authorization' => "token #{ENV['GITHUB_TOKEN']}"
}


# Update the Status API
def update_status(payload, status)
  sha = payload.after
  repo = payload.repository.full_name
  state, description = status.first

  # setup http post
  uri = URI.parse("#{GITHUB_ROOT}/repos/#{repo}/statuses/#{sha}")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true

  # post to GitHub
  params = {:state => state, :description => description, :context => CONTEXT}
  http.post(uri.path, params.to_json, HEADERS)
end


# Respond to WebHook Event
post '/payload' do
  payload = JSON.parse(request.body.read, object_class: OpenStruct)

  # update status
  update_status(payload, :success => "Ready to merge")
end
