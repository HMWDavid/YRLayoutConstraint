
Pod::Spec.new do |s|
  s.name         = "YRLayoutConstraint"
  s.version      = "1.0.5"
  s.summary      = "simple Custom NSLayoutConstraint."
  s.description  = "simple Custom NSLayoutConstraint."
  s.homepage     = "https://github.com/HMWDavid/YRLayoutConstraint"
  s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "洪绵卫" => "244160918@qq.com" }
  s.platform     = :ios, "7.0"
  s.ios.deployment_target = "7.0"
  s.source       = { :git => "https://github.com/HMWDavid/YRLayoutConstraint.git", :tag => "1.0.5"}
  s.source_files  = "YRLayoutConstraint/**/UIView+YRLayoutConstraint.{h,m}"
  s.requires_arc = true
end
