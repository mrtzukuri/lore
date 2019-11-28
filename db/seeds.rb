Profession.destroy_all
Skill.destroy_all

puts "Creating seeds."

professions = Profession.create!([{ name: "Front-End Developer", level: "Junior" },
                   { name: "UX/UI Designer", level: "Junior" },
                   { name: "Product Manager", level: "Junior" },
                   { name: "Back-End Developer", level: "Junior" }
                 ])


professions.first.save!

#Technology
Skill.create!([{name: "HTML", level: "Junior"},
             {name: "CSS / SCSS", level: "Junior"},
             {name: "Javascript / JQuery", level: "Junior"},
             {name: "Documentation", level: "Junior"},
             {name: "API", level: "Junior"},
             {name: "Command Line Interface Tools", level: "Junior"},
             {name: "Git / BitBucket", level: "Junior"},
             {name: "Implement Styles from Design Systems", level: "Junior"},
            ])

#Methodology
Skill.create!([{name: "Scrum", level: "Junior"},
               {name: "Agile", level: "Junior"},
              ])

#General
Skill.create!([{name: "Verbal Communication", level: "Junior"},
             {name: "Written Communication", level: "Junior"},
             {name: "Desktop Research", level: "Junior"},
            ])

#Behaviour
Skill.create!([{name: "Mental Agility", level: "Junior"},
             {name: "Work in a Team", level: "Junior"},
             {name: "Attention to Detail", level: "Junior"},
             {name: "Collaboration", level: "Junior"},
             {name: "Stakeholder Engagement", level: "Junior"},
             {name: "Problem Solving", level: "Junior"},
            ])

#iterate through list of skills and pass as a query to jobs
#coursera
# skills = Skill.all
# skills.each do |skill|
#   CourseraJob.perform_now(skill.name, 0, 10)
# # end
# #eventbrite => make sure to allow 10 minutes before seeding next skill
# #to avoid reseeding entire file you can run the below line in your rails c and change the argument
# EventbriteJob.perform_now('html')

# puts "Seeding Finished."

# puts "Activity seeds"

LearningOpportunity.create!({name: "JS Workshops",
  course_type: "meet up",
  location: "Melbourne, Australia",
  description: "Where we meet to hack together on JavaScript. We intend to run workshop/hacking sessions to learn upcoming ES6/7 features, and how to put new ideas into practice.",
  url: "https://www.meetup.com/MelbourneJS/"
})

LearningOpportunity.create!({name: "Melbourne CSS",
  course_type: "meet up",
  location: "Melbourne, Australia",
  description: "Melbourne's CSS and front-end discussion group. Do you know your floats, flexbox, and grid or want to learn more? Join now!
Get in touch if you'd like to present your work, sponsor or if you'd just like to say 'Hi'.",
  url: "https://www.meetup.com/Melbourne-CSS/"
})

LearningOpportunity.create!({name: "Agile Coaching Circles Melbourne",

  course_type: "meet up",
  location: "Melbourne, Australia",
  description: "Agile Coaching Circles is intended to provide support for the role of the Agile Coach and the competencies (i.e. facilitation, mentoring, teaching, and coaching) to become effective in that role through a community of practicing coaches.
Let's get together to share our successes and challenges with each other in order to support newer coaches and Scrum Masters, enhance our coaching skills and deepen our craft.",
  url: "https://www.meetup.com/AgileCoach/"
})

LearningOpportunity.create!({name: "SCRUM Practice, Melbourne",
  course_type: "meet up",
  location: "Melbourne, Australia",
  description: "This meetup is for those interested in practicing specifically SCRUM - most common Agile methodology practiced in IT industry.
At our SCRUM Workshops we help participants gain and share knowledge through practical experience. Each of our session is a quick overview (not more than 10 min) followed by a role play where we assign roles and play as SCRUM team as if we are delivering a project. At breaks and in the very end we discuss what SCRUM Master did right, wrong and what was the overall outcome of the session.
Workshops are free and open to all levels - no previous experience required. What's needed is true interest in Agile and desire to learn.
People with some knowledge of SCRUM, practicing Product Owners, BAs/PMs moving onto Agile space will also find it valuable as they will get to share their knowledge and help beginners.
More info in our Facebook group: https://www.facebook.com/groups/1125735887513166/?hc_ref=SEARCH",
  url: "https://www.meetup.com/SCRUMWORKS/"
})

LearningOpportunity.create!({name: "Melbourne APIs Meetup",
  course_type: "meet up",
  location: "Melbourne, Australia",
  description: "This is a meetup about APIs. Including API design, API management, API concepts and everything else API related.",
  url: "https://www.meetup.com/Melbourne-APIs-Meetup/"
})

LearningOpportunity.create!({name: "Everything API Melbourne",
  course_type: "meet up",
  location: "Melbourne, Australia",
  description: "This is a meetup about APIs. Including API design, API management, API concepts and everything else API related.",
  url: "https://www.meetup.com/Everything-API-Melbourne/"
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
  url: "https://www.meetup.com/City-Centre-Toastmasters-Meetup/"
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
  url: "https://www.meetup.com/Speaking-Presenting-Leadership/"
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
  url: "https://www.meetup.com/Melbourne-Communication-Skills-Development/"
})





