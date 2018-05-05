Pod::Spec.new do |s|
  s.name             = 'GTTexture-RxExtension'
  s.version          = '1.0.0'
  s.summary          = 'Texture RxSwift Extension'

  s.description      = 'Texture RxSwift Extension'

  s.homepage         = 'https://github.com/Geektree0101/GTTexture-RxExtension'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Geektree0101' => 'h2s1880@gmail.com' }
  s.source           = { :git => 'https://github.com/Geektree0101/GTTexture-RxExtension.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.3'
  s.source_files = 'GTTexture-RxExtension/Classes/**/*'
  s.dependency 'RxSwift', '~> 4.0'
  s.dependency 'RxCocoa', '~> 4.0'
  s.dependency 'Texture', '~> 2.6'
end
