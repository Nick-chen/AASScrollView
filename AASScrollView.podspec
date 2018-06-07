#
#  Be sure to run `pod spec lint AASScrollView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

    s.name         = "AASScrollView"
    s.version      = "0.0.1"
    s.summary      = "Base on LTScrollview create AASScrollView."
    s.description  = <<-DESC
            base on LTScrollView, develop language swift 4.1
                        DESC
    s.homepage     = "https://github.com/Nick-chen/AASScrollView"
    s.license      = { :type => "MIT", :file => "LICENSE" }

    s.author             = { "458318720@qq.com" => "458318720@qq.com" }
    s.ios.deployment_target = '8.0'

    s.source       = { :git => "https://github.com/Nick-chen/AASScrollView.git", :tag => s.version.to_s }
    s.source_files  = "AASScrollView", "AASScrollView/AASScrollView/lib/**/*.{h,m}"
    s.requires_arc = true

end
