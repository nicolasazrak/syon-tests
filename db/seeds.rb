# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


test1 = Test.create(description: 'PHP Senior developer')
test2 = Test.create(description: 'PHP Junior developer')

applicant1 = Applicant.create(name: 'Carlos', email: 'cacho@gmail.com')
applicant2 = Applicant.create(name: 'Juancito', email: 'jauncito@yahoo.com.ar')
applicant3 = Applicant.create(name: 'Pepe', email: 'pepe@hotmail.com')


Submission.create([{token: '7cs5e6a1c', applicant_id: applicant3.id, test_id: test1.id}])
Submission.create([{token: '7as5t6a1c', applicant_id: applicant1.id, test_id: test1.id}])
Submission.create([{token: '77s5t6a1c', applicant_id: applicant2.id, test_id: test1.id}])

Submission.create([{token: '78s3t6a1c', applicant_id: applicant3.id, test_id: test2.id}])
Submission.create([{token: '74s5t6a1c', applicant_id: applicant2.id, test_id: test2.id}])
Submission.create([{token: '73s5t6a1c', applicant_id: applicant1.id, test_id: test2.id}])

User.create(name: 'admin', email: 'admin@admin.com.ar', password: 'admin', is_admin: true)