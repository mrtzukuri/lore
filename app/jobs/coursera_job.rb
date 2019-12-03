class CourseraJob < ApplicationJob
  queue_as :default

  COURSERA_BASE_API_URL = 'https://api.coursera.org/api/courses.v1'
  COURSERA_INCLUDES = '&includes=v2Details,name'
  COURSERA_FIELDS = '&fields=description,name'

  def perform(skill, start, limit)
    request_url = COURSERA_BASE_API_URL + "?start=#{start}" + "&limit=#{limit}" + COURSERA_INCLUDES + COURSERA_FIELDS + "&q=search&query=#{skill.name}"
    response = HTTParty.get(request_url, format: :plain)
    courses = JSON.parse response, symbolize_names: true

    courses[:elements].each do |course|
      # Create your learning opportunities here
      start_date = DateTime.now + (rand * 90);
      end_date = start_date + (rand * 15);
      LearningOpportunity.create(
          start_date: start_date,
          end_date: end_date,
          name: course[:name],
          course_type: "online",
          url: "https://www.coursera.org/learn/#{course[:slug]}",
          description: course[:description],
          skills: [skill],
          price: rand(0..100),
        )
    end
  end
end
