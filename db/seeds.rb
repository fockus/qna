Question.destroy_all

Question.create!([{
                      title: 'NSDate issue with NSJSONSerialization when using Mantle library',
                      body: 'I have an issue serialising core data managed object into JSON object. ' +
                          'I am using Mantle to do this and this is related NSDate. I am getting this error.'
                  },
                  {
                      title: 'How to access computer\'s audio level of Mac speakers?',
                      body: 'What physics explains the enormous disparity between the gravitational scale and ' +
                          'the typical mass scale of the elementary particles? In other words, why is gravity ' +
                          'so much weaker than the other forces, like electromagnetism?'
                  },
                  {
                      title: 'Give me a cooking advice.',
                      body: 'Recently, I have started reading Rspec cooking book, but I do not understand ' +
                          'anything at all. How are you suppose to use these recepies? Do you bake them?'
                  }])

puts "Created #{Question.count} questions"
