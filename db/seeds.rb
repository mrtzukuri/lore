require 'open-uri'
require 'nokogiri'
require'pry'

Profession.destroy_all
Skill.destroy_all
LearningOpportunity.destroy_all

puts "Creating user seeds."

puts "Seeding Finished."
puts "Creating professions seeds."

professions = Profession.create!([{ name: "Front-End Developer" },
                   { name: "UX/UI Designer" },
                   { name: "Product Manager" },
                   { name: "Back-End Developer" }
                 ])

user = User.create!(email: 'user@user.com', password: '123456', profession: Profession.first, name: Faker::FunnyName.name, city: "sydney")

professions.first.save!
puts "Seeding Finished."

puts "Creating skills seeds."
# #Technology
Skill.create!([{name: "HTML", level: "Junior", skill_group: "Technology", profession: [Profession.first]},
               {name: "CSS / SCSS", level: "Junior", skill_group: "Technology", profession: [Profession.first]},
               {name: "Javascript / JQuery", level: "Junior", skill_group: "Technology", profession: [Profession.first]},
               {name: "Documentation", level: "Junior", skill_group: "Technology", profession: [Profession.first]},
               {name: "API", level: "Junior", skill_group: "Technology", profession: [Profession.first]},
               {name: "Command Line Interface Tools", level: "Junior", skill_group: "Technology", profession: [Profession.first]},
               {name: "Git / BitBucket", level: "Junior", skill_group: "Technology", profession: [Profession.first]},
               {name: "Implement Styles from Design Systems", level: "Junior", skill_group: "Technology", profession: [Profession.first]},
               {name: "Adobe Creative Suite", level: "Mid-Level" , skill_group: "Technology", profession: [Profession.first]},
               {name: "Bootstrap", level: "Mid-Level" , skill_group: "Technology", profession: [Profession.first]},
               {name: "Responsive Design", level: "Mid-Level" , skill_group: "Technology", profession: [Profession.first]},
               {name: "Cross Platform Design", level: "Mid-Level" , skill_group: "Technology", profession: [Profession.first]},
               {name: "Basic UX/UI Principles", level: "Mid-Level" , skill_group: "Technology", profession: [Profession.first]},
               {name: "Clean DRY Code", level: "Mid-Level" , skill_group: "Technology", profession: [Profession.first]},
               {name: "A/B Testing and Analytics", level: "Mid-Level" , skill_group: "Technology", profession: [Profession.first]},
               {name: "Webpack", level: "Mid-Level" , skill_group: "Technology", profession: [Profession.first]},
               {name: "Front-End Architecture", level: "Senior" , skill_group: "Technology", profession: [Profession.first]},
               {name: "Product Roadmap Planning", level: "Senior" , skill_group: "Technology", profession: [Profession.first]},
               {name: "Functional Requirements and Documentation", level: "Senior" , skill_group: "Technology", profession: [Profession.first]},
               {name: "Develop Design Systems", level: "Senior" , skill_group: "Technology", profession: [Profession.first]},
               {name: "Platform and SLA Maintenance", level: "Senior" , skill_group: "Technology", profession: [Profession.first]},
            ])

# # #Methodology
Skill.create!([{name: "Scrum", level: "Junior", skill_group: "Methodology", profession: [Profession.first]},
               {name: "Agile", level: "Junior", skill_group: "Methodology", profession: [Profession.first]},
               {name: "Object Oriented Principles", level: "Mid-Level" , skill_group: "Methodology", profession: [Profession.first]},
               {name: "Test Driven Development", level: "Senior" , skill_group: "Methodology", profession: [Profession.first]}
              ])

# # #General
Skill.create!([{name: "Verbal Communication", level: "Junior", skill_group: "General", profession: [Profession.first]},
             {name: "Written Communication", level: "Junior", skill_group: "General", profession: [Profession.first]},
             {name: "Desktop Research", level: "Junior", skill_group: "General", profession: [Profession.first]},
             {name: "Problem Solving", level: "Junior", skill_group: "General", profession: [Profession.first]},
             {name: "Keeping Up To Date with, and Driving Best Practice", level: "Mid-Level", skill_group: "General", profession: [Profession.first]},
             {name: "Mentoring", level: "Senior", skill_group: "General", profession: [Profession.first]},
             {name: "Build Overall Team Capability", level: "Senior", skill_group: "General", profession: [Profession.first]},
            ])

# # #Behaviour
Skill.create!([{name: "Mental Agility", level: "Junior", skill_group: "Behaviour", profession: [Profession.first]},
             {name: "Work in a Team", level: "Junior", skill_group: "Behaviour", profession: [Profession.first]},
             {name: "Attention to Detail", level: "Junior", skill_group: "Behaviour", profession: [Profession.first]},
             {name: "Collaboration", level: "Junior", skill_group: "Behaviour", profession: [Profession.first]},
             {name: "Stakeholder Engagement", level: "Mid-level", skill_group: "Behaviour", profession: [Profession.first]},
             {name: "Take Initiative", level: "Junior", skill_group: "Behaviour", profession: [Profession.first]},
            ])

puts "Seeding skills Finished."

puts "Creating coursera learning Opportunities seeds."

# iterate through list of skills and pass as a query to jobs
# coursera
skills = Skill.all
skills.each do |skill|
  CourseraJob.perform_now(skill, 0, 10)
end

puts "Seeding Finished."

#eventbrite => make sure to allow 10 minutes before seeding next skill
#to avoid reseeding entire file you can run the below line in your rails c and change the argument
# puts "Creating eventbrite learning Opportunities seeds."
# EventbriteJob.perform_now('html')
# puts "Seeding Finished."

puts "Creating meetup learning Opportunities seeds."

  url = "https://www.meetup.com/en-AU/topics/HTML/au/melbourne/"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search('.groupCard').each do |card|
    sub_url = card.search('a').first.values.first
    file = open(sub_url).read
    doc = Nokogiri::HTML(file)
    name = doc.search('.groupHomeHeader-groupNameLink').text
    desc = doc.search('.group-description').text.squish
    opp = LearningOpportunity.new(url: sub_url, skills: [Skill.find_by("name = 'HTML'")], name: name, description: desc, course_type: "Meet Up", location: "Melbourne, Australia")
    opp.save
  end

  url = "https://www.meetup.com/en-AU/topics/CSS/au/melbourne/"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search('.groupCard').each do |card|
    sub_url = card.search('a').first.values.first
    file = open(sub_url).read
    doc = Nokogiri::HTML(file)
    name = doc.search('.groupHomeHeader-groupNameLink').text
    desc = doc.search('.group-description').text.squish
    opp = LearningOpportunity.new(url: sub_url, skills: [Skill.find_by("name = 'CSS / SCSS'")], name: name, description: desc, course_type: "Meet Up", location: "Melbourne, Australia")
    opp.save
  end

  url = "https://www.meetup.com/en-AU/topics/Javascript/au/melbourne/"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search('.groupCard').each do |card|
    sub_url = card.search('a').first.values.first
    file = open(sub_url).read
    doc = Nokogiri::HTML(file)
    name = doc.search('.groupHomeHeader-groupNameLink').text
    desc = doc.search('.group-description').text.squish
    opp = LearningOpportunity.new(url: sub_url, skills: [Skill.find_by("name = 'Javascript / JQuery'")], name: name, description: desc, course_type: "Meet Up", location: "Melbourne, Australia")
    opp.save
  end

  url = "https://www.meetup.com/en-AU/topics/Adobe/au/melbourne/"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search('.groupCard').each do |card|
    sub_url = card.search('a').first.values.first
    file = open(sub_url).read
    doc = Nokogiri::HTML(file)
    name = doc.search('.groupHomeHeader-groupNameLink').text
    desc = doc.search('.group-description').text.squish
    opp = LearningOpportunity.new(url: sub_url, skills: [Skill.find_by("name = 'Adobe Creative Suite'")], name: name, description: desc, course_type: "Meet Up", location: "Melbourne, Australia")
    opp.save
  end

  url = "https://www.meetup.com/en-AU/topics/APIs/au/melbourne/"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search('.groupCard').each do |card|
    sub_url = card.search('a').first.values.first
    file = open(sub_url).read
    doc = Nokogiri::HTML(file)
    name = doc.search('.groupHomeHeader-groupNameLink').text
    desc = doc.search('.group-description').text.squish
    opp = LearningOpportunity.new(url: sub_url, skills: [Skill.find_by("name = 'API'")], name: name, description: desc, course_type: "Meet Up", location: "Melbourne, Australia")
    opp.save
  end

  url = "https://www.meetup.com/en-AU/topics/UX/au/melbourne/"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search('.groupCard').each do |card|
    sub_url = card.search('a').first.values.first
    file = open(sub_url).read
    doc = Nokogiri::HTML(file)
    name = doc.search('.groupHomeHeader-groupNameLink').text
    desc = doc.search('.group-description').text.squish
    opp = LearningOpportunity.new(url: sub_url, skills: [Skill.find_by("name = 'Basic UX/UI Principles'")], name: name, description: desc, course_type: "Meet Up", location: "Melbourne, Australia")
    opp.save
  end

  url = "https://www.meetup.com/en-AU/topics/Webpack/au/melbourne/"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search('.groupCard').each do |card|
    sub_url = card.search('a').first.values.first
    file = open(sub_url).read
    doc = Nokogiri::HTML(file)
    name = doc.search('.groupHomeHeader-groupNameLink').text
    desc = doc.search('.group-description').text.squish
    opp = LearningOpportunity.new(url: sub_url, skills: [Skill.find_by("name = 'Webpack'")], name: name, description: desc, course_type: "Meet Up", location: "Melbourne, Australia")
    opp.save
  end

  url = "https://www.meetup.com/en-AU/topics/FrontEnd/au/melbourne/"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search('.groupCard').each do |card|
    sub_url = card.search('a').first.values.first
    file = open(sub_url).read
    doc = Nokogiri::HTML(file)
    name = doc.search('.groupHomeHeader-groupNameLink').text
    desc = doc.search('.group-description').text.squish
    opp = LearningOpportunity.new(url: sub_url, skills: [Skill.find_by("name = 'Front-End Architecture'")], name: name, description: desc, course_type: "Meet Up", location: "Melbourne, Australia")
    opp.save
  end

  url = "https://www.meetup.com/en-AU/topics/Scrum/au/melbourne/"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search('.groupCard').each do |card|
    sub_url = card.search('a').first.values.first
    file = open(sub_url).read
    doc = Nokogiri::HTML(file)
    name = doc.search('.groupHomeHeader-groupNameLink').text
    desc = doc.search('.group-description').text.squish
    opp = LearningOpportunity.new(url: sub_url, skills: [Skill.find_by("name = 'Scrum'")], name: name, description: desc, course_type: "Meet Up", location: "Melbourne, Australia")
    opp.save
  end

  url = "https://www.meetup.com/en-AU/topics/Agile/au/melbourne/"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search('.groupCard').each do |card|
    sub_url = card.search('a').first.values.first
    file = open(sub_url).read
    doc = Nokogiri::HTML(file)
    name = doc.search('.groupHomeHeader-groupNameLink').text
    desc = doc.search('.group-description').text.squish
    opp = LearningOpportunity.new(url: sub_url, skills: [Skill.find_by("name = 'Agile'")], name: name, description: desc, course_type: "Meet Up", location: "Melbourne, Australia")
    opp.save
  end

  url = "https://www.meetup.com/en-AU/topics/ToastMasters/au/melbourne/"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search('.groupCard').each do |card|
    sub_url = card.search('a').first.values.first
    file = open(sub_url).read
    doc = Nokogiri::HTML(file)
    name = doc.search('.groupHomeHeader-groupNameLink').text
    desc = doc.search('.group-description').text.squish
    opp = LearningOpportunity.new(url: sub_url, skills: [Skill.find_by("name = 'Verbal Communication'")], name: name, description: desc, course_type: "Meet Up", location: "Melbourne, Australia")
    opp.save
  end


puts "Seeding Finished."





