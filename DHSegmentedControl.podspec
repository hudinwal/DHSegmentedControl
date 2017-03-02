#
# Be sure to run `pod lib lint DHSegmentedControl.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DHSegmentedControl'
  s.version          = '0.1.0'
  s.summary          = 'Scrollable segmented control'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
DHSegmentedControl is drop in replacement of the UISegementedControl. Why you need it? If you have lots of segments, UISegmentedControl breaks the UI.
                       DESC

  s.homepage         = 'https://github.com/hudinwal/DHSegmentedControl'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'd_hudinwal' => 'dinesh_hudinwal@hotmail.com' }
  s.source           = { :git => 'https://github.com/hudinwal/DHSegmentedControl.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/d_hudinwal'

  s.ios.deployment_target = '9.0'

  s.source_files = 'DHSegmentedControl/Classes/**/*'
  

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit'
end
