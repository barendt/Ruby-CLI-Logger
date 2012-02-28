Gem::Specification.new do |s|
  s.name = "rcl"
  s.version = "0.1.pre"
  s.platform = Gem::Platform::RUBY
  s.authors = ["Greg Barendt"]
  s.email = ["github@gregbarendt.com"]
  s.homepage = "https://github.com/barendt/Ruby-CLI-Logger"
  s.summary = "CLI utility for writing quick log entries and pulling them back."

  s.add_development_dependency "rspec"
  s.add_runtime_dependency "chronic"
  s.add_runtime_dependency "sequel"

  s.files = Dir.glob("{bin,lib}/**/*") + %w(README.md)
  s.executables = ['rcl']
  s.require_path = 'lib'
end
