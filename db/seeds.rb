# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Profession.destroy_all
SkillGroup.destroy_all
Skill.destroy_all

puts "Creating seeds."

professions = Profession.create!([{ name: "Junior Front-End Developer" },
                   { name: "Mid-Level Front-End Developer" },
                   { name: "Senior Front-End Developer" },
                   { name: "Junior UX/UI Designer" },
                   { name: "Mid-Level UX/UI Designer" },
                   { name: "Senior UX/UI Designer" },
                   { name: "Junior Product Manager" },
                   { name: "Mid-Level Product Manager" },
                   { name: "Senior Product Manager" },
                   { name: "Junior Back-End Developer" },
                   { name: "Mid-Level Back-End Developer" },
                   { name: "Senior Back-End Developer" }])

skill_groups = SkillGroup.create!([{ name: "Technology"},
                   { name: "Methodology" },
                   { name: "General" },
                   { name: "Behaviour" }])

SkillGroup.all.each do |skill_group|
  Profession.where("name = 'Junior Front-End Developer'").first.skill_groups << skill_group
end

professions.first.save!

#Technology
Skill.create!([{name: "HTML", skill_group: skill_groups.first},
             {name: "CSS / SCSS", skill_group: skill_groups.first},
             {name: "Javascript / JQuery", skill_group: skill_groups.first},
             {name: "Documentation", skill_group: skill_groups.first},
             {name: "API", skill_group: skill_groups.first},
             {name: "Command Line Interface Tools", skill_group: skill_groups.first},
             {name: "Git / BitBucket", skill_group: skill_groups.first},
             {name: "Implement Styles from Design Systems", skill_group: skill_groups.first},
            ])

#Methodology
Skill.create!([{name: "Scrum", skill_group: skill_groups[1]},
               {name: "Agile", skill_group: skill_groups[1]},
              ])

#General
Skill.create!([{name: "Verbal Communication", skill_group: skill_groups[2]},
             {name: "Written Communication", skill_group: skill_groups[2]},
             {name: "Desktop Research", skill_group: skill_groups[2]},
            ])

#Behaviour
Skill.create!([{name: "Mental Agility", skill_group: skill_groups[3]},
             {name: "Work in a Team", skill_group: skill_groups[3]},
             {name: "Attention to Detail", skill_group: skill_groups[3]},
             {name: "Collaboration", skill_group: skill_groups[3]},
             {name: "Stakeholder Engagement", skill_group: skill_groups[3]},
             {name: "Problem Solving", skill_group: skill_groups[3]},
            ])


puts "Seeding Finished."
