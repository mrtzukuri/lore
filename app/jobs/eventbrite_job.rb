class EventbriteJob < ApplicationJob
  queue_as :default

  EVENTBRITE_OAUTH_URL = "https://www.eventbriteapi.com/v3/users/me/?token=#{ENV['EVENTBRITE_TOKEN']}"
  EVENTBRITE_SEARCH_URL = "https://www.eventbriteapi.com/v3/events/search/"

  def perform(query)

    # 1. Retrieve an OAuth token from Eventbrite API
    response = HTTParty.get(EVENTBRITE_OAUTH_URL, format: :json)
    token = response.headers["x-rate-limit"].split(' ').first
    token.slice!(0, 6)

    # 2. Use OAuth token to query Eventbrite search
    request_url = EVENTBRITE_SEARCH_URL + "?q=#{query}" + "&token=#{token}"
    response = HTTParty.get(request_url, format: :json)

    response["events"].each do |event|
      LearningOpportunity.create(
        name: event["name"]["text"],
        start_date: event["start"]["local"],
        end_date: event["end"]["local"],
        location: "Melbourne, Australia",
        description: event["description"]["text"],
        url: event["url"],
        course_type: event["online_event"].to_s,
        event_picture: event["logo"]["original"]["url"]
      )

    end
  end
end
