Gem::Specification.new do |s|
	s.name        = 'wemo'
	s.version     = '1'
	s.date        = '2019-03-03'
	s.summary     = "Wemo Ruby"
	s.description = "A simple ruby Wemo SDK"
	s.authors     = ["andmeek"]
	s.email       = '...'
	s.files       = ["lib/wemo.rb"]
	s.homepage    = 'https://github.com/andmeek/wemo'
	s.license     = 'MIT'

	s.add_dependency "activesupport", "~> 4.2.7"

	s.add_runtime_dependency "frisky"
end
