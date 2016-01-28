Pod::Spec.new do |s|
  s.name             = "HNAPI"
  s.version          = "0.1.0"
  s.summary          = "A HackerNews API Client."

  s.homepage         = "https://github.com/lexrus/HNAPI"
  s.license          = 'MIT'
  s.author           = { "lexrus" => "lexrus@gmail.com" }
  s.source           = { :git => "https://github.com/lexrus/HNAPI.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/lexrus'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Sources/**/*'
  s.frameworks = 'Foundation'
  s.dependency 'Moya', '~> 6.0'
  s.dependency 'Moya-ObjectMapper', '~> 1.1'
  s.dependency 'Moya-ObjectMapper/RxSwift', '~> 1.1'
end
