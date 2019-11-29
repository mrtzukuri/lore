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
#Technology
Skill.create!([{name: "HTML", level: "Junior", skill_group: "Technology", profession: [Profession.first]},
               {name: "CSS / SCSS", level: "Junior", skill_group: "Technology", profession: [Profession.first]},
               {name: "Javascript / JQuery", level: "Junior", skill_group: "Technology", profession: [Profession.first]},
               {name: "Documentation", level: "Junior", skill_group: "Technology", profession: [Profession.first]},
               {name: "API", level: "Junior", skill_group: "Technology", profession: [Profession.first]},
               {name: "Command Line Interface Tools", level: "Junior", skill_group: "Technology", profession: [Profession.first]},
               {name: "Git / BitBucket", level: "Junior", skill_group: "Technology", profession: [Profession.first]},
               {name: "Implement Styles from Design Systems", level: "Junior", skill_group: "Technology", profession: [Profession.first]},
               {name: "Abobe Creative Suite", level: "Mid-Level" , skill_group: "Technology", profession: [Profession.first]},
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

#Methodology
Skill.create!([{name: "Scrum", level: "Junior", skill_group: "Methodology", profession: [Profession.first]},
               {name: "Agile", level: "Junior", skill_group: "Methodology", profession: [Profession.first]},
               {name: "Object Oriented Principles", level: "Mid-Level" , skill_group: "Methodology", profession: [Profession.first]},
               {name: "Test Driven Development", level: "Senior" , skill_group: "Methodology", profession: [Profession.first]}
              ])

#General
Skill.create!([{name: "Verbal Communication", level: "Junior", skill_group: "General", profession: [Profession.first]},
             {name: "Written Communication", level: "Junior", skill_group: "General", profession: [Profession.first]},
             {name: "Desktop Research", level: "Junior", skill_group: "General", profession: [Profession.first]},
             {name: "Problem Solving", level: "Junior", skill_group: "General", profession: [Profession.first]},
             {name: "Keeping Up To Date with, and Driving Best Practice", level: "Mid-Level", skill_group: "General", profession: [Profession.first]},
             {name: "Mentoring", level: "Senior", skill_group: "General", profession: [Profession.first]},
             {name: "Build Overall Team Capability", level: "Senior", skill_group: "General", profession: [Profession.first]},
            ])

#Behaviour
Skill.create!([{name: "Mental Agility", level: "Junior", skill_group: "Behaviour", profession: [Profession.first]},
             {name: "Work in a Team", level: "Junior", skill_group: "Behaviour", profession: [Profession.first]},
             {name: "Attention to Detail", level: "Junior", skill_group: "Behaviour", profession: [Profession.first]},
             {name: "Collaboration", level: "Junior", skill_group: "Behaviour", profession: [Profession.first]},
             {name: "Stakeholder Engagement", level: "Mid-level", skill_group: "Behaviour", profession: [Profession.first]},
             {name: "Take Initiative", level: "Junior", skill_group: "Behaviour", profession: [Profession.first]},
            ])

puts "Seeding Finished."
#iterate through list of skills and pass as a query to jobs
#coursera

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

LearningOpportunity.create!({name: "JS Workshops",
  course_type: "meet up",
  location: "Melbourne, Australia",
  description: "Where we meet to hack together on JavaScript. We intend to run workshop/hacking sessions to learn upcoming ES6/7 features, and how to put new ideas into practice.",
  url: "https://www.meetup.com/MelbourneJS/",
  skills: [Skill.find_by("name = 'Javascript / JQuery'")]
})

LearningOpportunity.create!({name: "Melbourne CSS",
  course_type: "meet up",
  location: "Melbourne, Australia",
  description: "Melbourne's CSS and front-end discussion group. Do you know your floats, flexbox, and grid or want to learn more? Join now!
Get in touch if you'd like to present your work, sponsor or if you'd just like to say 'Hi'.",
  url: "https://www.meetup.com/Melbourne-CSS/",
  skills: [Skill.find_by("name = 'CSS / SCSS'")]
})

LearningOpportunity.create!({name: "Agile Coaching Circles Melbourne",

  course_type: "meet up",
  location: "Melbourne, Australia",
  description: "Agile Coaching Circles is intended to provide support for the role of the Agile Coach and the competencies (i.e. facilitation, mentoring, teaching, and coaching) to become effective in that role through a community of practicing coaches.
Let's get together to share our successes and challenges with each other in order to support newer coaches and Scrum Masters, enhance our coaching skills and deepen our craft.",
  url: "https://www.meetup.com/AgileCoach/",
  skills: [Skill.find_by("name = 'Agile'")]
})

LearningOpportunity.create!({name: "SCRUM Practice, Melbourne",
  course_type: "meet up",
  location: "Melbourne, Australia",
  description: "This meetup is for those interested in practicing specifically SCRUM - most common Agile methodology practiced in IT industry.
At our SCRUM Workshops we help participants gain and share knowledge through practical experience. Each of our session is a quick overview (not more than 10 min) followed by a role play where we assign roles and play as SCRUM team as if we are delivering a project. At breaks and in the very end we discuss what SCRUM Master did right, wrong and what was the overall outcome of the session.
Workshops are free and open to all levels - no previous experience required. What's needed is true interest in Agile and desire to learn.
People with some knowledge of SCRUM, practicing Product Owners, BAs/PMs moving onto Agile space will also find it valuable as they will get to share their knowledge and help beginners.
More info in our Facebook group: https://www.facebook.com/groups/1125735887513166/?hc_ref=SEARCH",
  url: "https://www.meetup.com/SCRUMWORKS/",
  skills: [Skill.find_by("name = 'Scrum'")]
})

LearningOpportunity.create!({name: "Melbourne APIs Meetup",
  course_type: "meet up",
  location: "Melbourne, Australia",
  description: "This is a meetup about APIs. Including API design, API management, API concepts and everything else API related.",
  url: "https://www.meetup.com/Melbourne-APIs-Meetup/",
  skills: [Skill.find_by("name = 'API'")]
})

LearningOpportunity.create!({name: "Everything API Melbourne",
  course_type: "meet up",
  location: "Melbourne, Australia",
  description: "This is a meetup about APIs. Including API design, API management, API concepts and everything else API related.",
  url: "https://www.meetup.com/Everything-API-Melbourne/",
  skills: [Skill.find_by("name = 'API'")]
})

LearningOpportunity.create!({name: "City Centre Toastmasters.",
  course_type: "meet up",
  location: "Melbourne, Australia",
  description: "What makes City Centre Toastmasters Club unique? We help young professionals, including people from an English as a Second Language background, develop their professional and conversational English-speaking skills.
Located in the heart of the city, after the work day has ended, City Centre Toastmasters attracts young professionals who want to advance their careers through developing their public speaking and leadership skills.
City Centre Toastmasters has a friendly environment made up of supportive people who want to help each other to become better speakers and leaders. We are a part of Toastmasters International, a worldwide organisation that has been helping people to develop confidence in public speaking for more than 90 years. Now in 135 countries with over 345,000 members, it is the world's biggest community organisation dedicated to helping people become better leaders and communicators.
When and Where do we meet?
When: We meet the 2nd and 4th Mondays of each month, 6:15pm for 6:30pm - 8:00pm.
Where: Melbourne Multicultural Hub (https://maps.google.com/maps?f=q&hl=en&q=506+Elizabeth+Street%2C+Melbourne%2C+au) 506 Elizabeth Street, Melbourne.
FREE for guests to attend. All are welcome.",
  url: "https://www.meetup.com/City-Centre-Toastmasters-Meetup/",
  skills: [Skill.find_by("name = 'Verbal Communication'")]
})

LearningOpportunity.create!({name: "Speaking, Presenting & Leadership",
  course_type: "meet up",
  location: "Melbourne, Australia",
  description: "We help people improve their speaking, presenting and leadership skills in a safe and friendly environment. You won't walk into a room of expert speakers, but rather just average people looking to improve their speaking and socialise. We are a diverse group with varied skills and background.
What makes our club unique?
1. We teach real leadership, including the language, intent, body language, etc
2. Members have the chance to put leadership into practice, by adding leadership components to meeting roles
3.Members have the chance to help and lead real world commercial-style events that we host
With our friendly tips you will be amazed how quickly your leading & speaking improves.
When and where?
We meet every Tuesday from 6.15 to 8.15pm at Lvl1, Multicultural Hub (Purple Room)
Feel free to drop by to our meetings as a guest!",
  url: "https://www.meetup.com/Speaking-Presenting-Leadership/",
  skills: [Skill.find_by("name = 'Verbal Communication'")]
})

LearningOpportunity.create!({name: "Melbourne Communication Skills Development",
  course_type: "meet up",
  location: "Melbourne, Australia",
  description: "Whether we like it or not we are dependent on others to achieve
what we want.
Our personal success depends on our relationships.
Our relationships depend on our ability to communicate effectively.
Not just with others.
Importantly with ourself!
The intention of this group is to enhance our personal power,
our ability to achieve what we want,
while reducing verbal violence and bullying.
By enhancing our communication skills.
This is the group for you.
If you want a more productive and enjoyable life.
If you have ever wondered why all the excellent communication tips
you've tried don't seem to work for you.",
  url: "https://www.meetup.com/Melbourne-Communication-Skills-Development/",
  skills: [Skill.find_by("name = 'Verbal Communication'")]
})

puts "Seeding Finished."





