require_relative('./person')
require_relative('./trimmer')
require_relative('./capitalize')
require_relative('./nameable')
require_relative('./decorator')
p person = Person.new(22, 'maximilianus')
p person.correct_name
capitalizedPerson = Capitalize.new(person)
 p capitalizedPerson
p capitalizedPerson.correct_name
# capitalizedTrimmedPerson = Trimmer.new(capitalizedPerson)
# p capitalizedTrimmedPerson.correct_name
