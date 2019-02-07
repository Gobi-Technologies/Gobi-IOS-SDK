#
# Be sure to run `pod lib lint GobiSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GobiSDK'
  s.version          = '0.0.2'
  s.summary          = 'A short description of GobiSDK.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Long description for GobiSDK with detailed description
                       DESC

  s.homepage         = 'https://github.com/Gobitech/Gobi-IOS-SDK'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Gobitech' => 'andreas@gobiapp.com' }
  s.source           = { :git => 'https://github.com/Gobitech/Gobi-IOS-SDK.git', :tag => '0.0.2' }

  s.ios.deployment_target = '10.0'
  s.vendored_frameworks = 'GobiSDK.framework'

end
