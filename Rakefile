# Look in the tasks/setup.rb file for the various options that can be
# configured in this Rakefile. The .rake files in the tasks directory
# are where the options are used.

begin
  require 'bones'
  Bones.setup
rescue LoadError
  load 'tasks/setup.rb'
end

ensure_in_path 'lib'
depend_on 'json'

require 'nom'

task :default => 'spec:run'

PROJ.name = 'nom'
PROJ.authors = 'Xavier Shay'
PROJ.email = 'contact@rhnh.net'
PROJ.url = 'http://ausnom.com'
PROJ.version = Nom::VERSION
#PROJ.rubyforge.name = 'nom'

PROJ.spec.opts << '--color'

# EOF
