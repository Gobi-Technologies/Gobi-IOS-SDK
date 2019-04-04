#
# Be sure to run `pod lib lint GobiSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GobiSDK'
  s.version          = '0.2'
  s.summary          = 'The Gobi iOS SDK makes it quick and easy to integrate engaging and interactive story functionality in your iOS app'

  s.description      = <<-DESC
  The Gobi iOS SDK makes it easy to integrate Gobi stories into your own app
  
  Gobi stories:
  -    Administer the user generated stories by allowing or declining content
  -    Keep content live for as long as you want
  -    Combine engaging stories with interactive voting/link stickers to lead more retention, traffic and commerce
  -    Analytics
  -    Web admin tool
  DESC

  s.homepage         = 'https://github.com/Gobitech/Gobi-IOS-SDK'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Gobitech' => 'andreas@gobiapp.com' }
  s.source           = { :git => 'https://github.com/Gobitech/Gobi-IOS-SDK.git', :tag => '0.2' }

  s.ios.deployment_target = '10.0'
  s.vendored_frameworks = 'GobiSDK.framework'

end
