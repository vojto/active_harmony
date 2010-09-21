# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{active_harmony}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Vojto Rinik"]
  s.date = %q{2010-09-21}
  s.description = %q{Active Harmony is a Ruby library that takes care of synchronizing changes between local Ruby objects and remote REST services.}
  s.email = %q{vojto@rinik.net}
  s.files = [
    ".rvmrc",
     "Gemfile",
     "Gemfile.lock",
     "lib/active_harmony.rb",
     "lib/active_harmony/queue.rb",
     "lib/active_harmony/queue_item.rb",
     "lib/active_harmony/service.rb",
     "lib/active_harmony/service_manager.rb",
     "lib/active_harmony/service_url.rb",
     "lib/active_harmony/synchronizable.rb",
     "lib/active_harmony/synchronizable/core.rb",
     "lib/active_harmony/synchronizable/mongoid.rb",
     "lib/active_harmony/synchronizer.rb",
     "lib/active_harmony/synchronizer_configuration.rb",
     "spec/spec_helper.rb",
     "spec/unit/active_harmony/queue_item_spec.rb",
     "spec/unit/active_harmony/queue_spec.rb",
     "spec/unit/active_harmony/service_manager_spec.rb",
     "spec/unit/active_harmony/service_spec.rb",
     "spec/unit/active_harmony/synchronizable/core_spec.rb",
     "spec/unit/active_harmony/synchronizable/mongoid_spec.rb",
     "spec/unit/active_harmony/synchronizer_configuration_spec.rb",
     "spec/unit/active_harmony/synchronizer_spec.rb"
  ]
  s.homepage = %q{http://github.com/vojto/active_harmony}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Ruby synchronization with REST services}
  s.test_files = [
    "spec/spec_helper.rb",
     "spec/unit/active_harmony/queue_item_spec.rb",
     "spec/unit/active_harmony/queue_spec.rb",
     "spec/unit/active_harmony/service_manager_spec.rb",
     "spec/unit/active_harmony/service_spec.rb",
     "spec/unit/active_harmony/synchronizable/core_spec.rb",
     "spec/unit/active_harmony/synchronizable/mongoid_spec.rb",
     "spec/unit/active_harmony/synchronizer_configuration_spec.rb",
     "spec/unit/active_harmony/synchronizer_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

