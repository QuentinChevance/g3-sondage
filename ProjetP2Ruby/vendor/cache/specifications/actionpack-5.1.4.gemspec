# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "actionpack"
  s.version = "5.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["David Heinemeier Hansson"]
  s.date = "2017-09-08"
  s.description = "Web apps on Rails. Simple, battle-tested conventions for building and testing MVC web applications. Works with any Rack-compatible server."
  s.email = "david@loudthinking.com"
  s.homepage = "http://rubyonrails.org"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2.2")
  s.requirements = ["none"]
  s.rubygems_version = "2.0.3"
  s.summary = "Web-flow and rendering framework putting the VC in MVC (part of Rails)."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, ["= 5.1.4"])
      s.add_runtime_dependency(%q<rack>, ["~> 2.0"])
      s.add_runtime_dependency(%q<rack-test>, [">= 0.6.3"])
      s.add_runtime_dependency(%q<rails-html-sanitizer>, [">= 1.0.2", "~> 1.0"])
      s.add_runtime_dependency(%q<rails-dom-testing>, ["~> 2.0"])
      s.add_runtime_dependency(%q<actionview>, ["= 5.1.4"])
      s.add_development_dependency(%q<activemodel>, ["= 5.1.4"])
    else
      s.add_dependency(%q<activesupport>, ["= 5.1.4"])
      s.add_dependency(%q<rack>, ["~> 2.0"])
      s.add_dependency(%q<rack-test>, [">= 0.6.3"])
      s.add_dependency(%q<rails-html-sanitizer>, [">= 1.0.2", "~> 1.0"])
      s.add_dependency(%q<rails-dom-testing>, ["~> 2.0"])
      s.add_dependency(%q<actionview>, ["= 5.1.4"])
      s.add_dependency(%q<activemodel>, ["= 5.1.4"])
    end
  else
    s.add_dependency(%q<activesupport>, ["= 5.1.4"])
    s.add_dependency(%q<rack>, ["~> 2.0"])
    s.add_dependency(%q<rack-test>, [">= 0.6.3"])
    s.add_dependency(%q<rails-html-sanitizer>, [">= 1.0.2", "~> 1.0"])
    s.add_dependency(%q<rails-dom-testing>, ["~> 2.0"])
    s.add_dependency(%q<actionview>, ["= 5.1.4"])
    s.add_dependency(%q<activemodel>, ["= 5.1.4"])
  end
end
