class CourseraJob < ApplicationJob
  queue_as :default

  COURSERA_BASE_API_URL = 'https://api.coursera.org/api/courses.v1'
  COURSERA_INCLUDES = '&includes=v2Details,name'
  COURSERA_FIELDS = '&fields=description,name'

  def perform(query, start, limit)
    request_url = COURSERA_BASE_API_URL + "?start=#{start}" + "&limit=#{limit}" + COURSERA_INCLUDES + COURSERA_FIELDS + "&q=search&query=#{query}"
    response = HTTParty.get(request_url, format: :plain)
    courses = JSON.parse response, symbolize_names: true

    courses[:elements].each do |course|
      # Create your learning opportunities here
      LearningOpportunity.create(
          name: course[:name],
          course_type: "online",
          url: "https://www.coursera.org/learn/#{course[:slug]}",
          description: course[:description]
        )
    end
  end

end
