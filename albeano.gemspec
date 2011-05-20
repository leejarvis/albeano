Gem::Specification.new do |s|
  s.name = 'albeano'
  s.version = '1.0.0'
  s.summary = 'BBCode style wrapper for Pygments'
  s.description = 'Albeano lets you to write language specifics code snippets within text and returns Pygments generated HTML syntax highlighted code'
  s.author = 'Lee Jarvis'
  s.email = 'lee@jarvis.co'
  s.required_ruby_version = '>= 1.8.6'
  s.files = ['LICENSE', 'README.md', 'lib/albeano.rb', 'spec/albeano_spec.rb']
  s.add_dependency('albino', '~> 1.3.3')
  s.add_development_dependency('rspec', '= 2.1.0')
end
