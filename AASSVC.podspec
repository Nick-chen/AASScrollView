
Pod::Spec.new do |s|

s.name         = "AASSVC"
s.version      = "0.0.1"
s.summary      = "Base on LTScrollview create AASScrollView."
s.description  = <<-DESC
base on LTScrollView, develop language swift 4.1
DESC
s.homepage     = "https://github.com/Nick-chen/AASScrollView"
s.license      = { :type => "MIT", :file => "LICENSE" }

s.author             = { "458318720@qq.com" => "458318720@qq.com" }
s.ios.deployment_target = '9.0'

s.source       = { :git => "https://github.com/Nick-chen/AASScrollView.git", :tag => s.version.to_s }
s.source_files  = "AASScrollView", "AASScrollView/AASScrollView/lib/*.swift"
s.requires_arc = true
s.swift_version = '4.1'

end
