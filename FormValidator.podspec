#
# Be sure to run `pod lib lint FormValidator.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FormValidator'
  s.version          = '0.1.0'
  s.summary          = 'An easier way to validate your forms'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'With this CocoaPod, your form validation will become way more easier!!'

  s.homepage         = 'https://github.com/pescadjiam/FormValidator-Swift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Miguel Pescadinha' => 'pescalogin@gmail.com' }
  s.source           = { :git => 'https://github.com/<GITHUB_USERNAME>/FormValidator.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'FormValidator/Classes/**/*'
  
  # s.resource_bundles = {
  #   'FormValidator' => ['FormValidator/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
