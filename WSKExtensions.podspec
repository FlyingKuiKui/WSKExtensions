#
# Be sure to run `pod lib lint WSKExtensions.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WSKExtensions'
  s.version          = '0.1.3'
  s.summary          = 'A short description of WSKExtensions.'

  s.description      = "常用组件库"

  s.homepage         = 'https://github.com/FlyingKuiKui/WSKExtensions'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sehngkuiwang' => 'shengkuiwang@126.com' }
  s.source           = { :git => 'https://github.com/FlyingKuiKui/WSKExtensions.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'WSKExtensions/Classes/**/*'
  
  # s.resource_bundles = {
  #   'WSKExtensions' => ['WSKExtensions/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
