Gem::Specification.new do |s|
  s.name     = 'nom'
  s.version  = '0.9.2'
  s.summary  = 'Command line access to ausnom.com (AU and NZ nutritional data)'
  s.platform = Gem::Platform::RUBY
  s.authors  = ["Xavier Shay"]
  s.email    = ["hello@xaviershay.com"]
  s.homepage = "http://github.com/xaviershay/nom"
  s.has_rdoc = false

  s.files    = Dir.glob("{spec,lib}/**/*.rb") + 
               Dir.glob("bin/*") +
               %w(lib/.nom README.rdoc HISTORY LICENSE Rakefile)

  s.bindir       = 'bin'
  s.require_path = 'lib'
  s.executables << %q{nom}

  s.add_dependency 'json_pure'
  s.add_development_dependency 'rspec', '~> 2.1.0'
  s.add_development_dependency 'rr'
end
