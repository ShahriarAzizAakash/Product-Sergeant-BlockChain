# -*- encoding: utf-8 -*-
# stub: jwt_sessions 2.6.0 ruby lib

Gem::Specification.new do |s|
  s.name = "jwt_sessions".freeze
  s.version = "2.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/tuwukee/jwt_sessions/issues", "changelog_uri" => "https://github.com/tuwukee/jwt_sessions/blob/master/CHANGELOG.md", "homepage_uri" => "https://github.com/tuwukee/jwt_sessions", "source_code_uri" => "https://github.com/tuwukee/jwt_sessions" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Yulia Oletskaya".freeze]
  s.date = "2021-06-01"
  s.description = "XSS/CSRF safe JWT auth designed for SPA".freeze
  s.email = "yulia.oletskaya@gmail.com".freeze
  s.homepage = "http://rubygems.org/gems/jwt_sessions".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.2.0".freeze
  s.summary = "JWT Sessions".freeze

  s.installed_by_version = "3.2.0" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<jwt>.freeze, [">= 2.2.3", "< 3"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 1.16"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 12.3"])
  else
    s.add_dependency(%q<jwt>.freeze, [">= 2.2.3", "< 3"])
    s.add_dependency(%q<bundler>.freeze, [">= 1.16"])
    s.add_dependency(%q<rake>.freeze, ["~> 12.3"])
  end
end
