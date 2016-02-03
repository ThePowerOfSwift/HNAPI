Pod::Spec.new do |s|
  s.name             = "HNAPI"
  s.version          = "0.2.0"
  s.summary          = "Tiny HackerNews API wrapper."

  s.homepage         = "https://github.com/lexrus/HNAPI"
  s.license          = 'MIT'
  s.author           = { "lexrus" => "lexrus@gmail.com" }
  s.source           = { :git => "https://github.com/lexrus/HNAPI.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/lexrus'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'
  s.requires_arc = true

  s.source_files = 'Sources/**/*'
  s.frameworks = 'Foundation'
end
