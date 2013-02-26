Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_posts'
  s.version     = '0.60.0'
  s.summary     = 'Adds basic Posts to Spree'
  s.description = 'Built from spree_pages '
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'sebastyuiop'
  # s.email             = 'david@loudthinking.com'
  # s.homepage          = 'http://www.rubyonrails.org'
  # s.rubyforge_project = 'actionmailer'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency('spree_core', '~> 1.3.0')
  s.add_runtime_dependency('acts-as-taggable-on', '~> 2.3.1')
end
