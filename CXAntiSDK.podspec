#
# Be sure to run `pod lib lint CXAntiSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do | s |
    s.name             = 'CXAntiSDK'
    s.version          = '1.0'
    s.summary          = '反作弊SDK'
    
    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!
    
    s.description      = '反作弊SDK'
    
    s.homepage         = 'https://github.com/ishaolin/CXAntiSDK'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'wshaolin' => 'ishaolin@163.com' }
    s.source           = { :git => 'https://github.com/ishaolin/CXAntiSDK.git', :tag => s.version.to_s }
    
    s.ios.deployment_target = '9.0'
    
    s.public_header_files = 'CXAntiSDK/Classes/**/*.h'
    s.source_files = 'CXAntiSDK/Classes/**/*'

    s.dependency 'CXFoundation'
    s.dependency 'CXNetSDK'
    s.dependency 'CXUIKit'
end
