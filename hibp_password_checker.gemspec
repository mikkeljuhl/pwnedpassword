
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
#require "hibp_password_checker"

Gem::Specification.new do |spec|
  spec.name          = "hibp_password_checker"
  spec.version       = "0.0.1"
  spec.authors       = ["Mikkel Jeppesen Juhl"]
  spec.email         = ["mail@mikkeljuhl.com"]

  spec.summary       = "API Wrapper to check if password has been pwned using haveibeenpwned"
  spec.description   = "hibp_password_checker uses the haveibeenpwned api, to send the first 5 chars of your SHA1'ed passowrd. Then it does a local comparision of list of returned hashes from haveibeenpwned."
  spec.homepage      = "https://github.com/mikkeljuhl/pwnedpassword"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
