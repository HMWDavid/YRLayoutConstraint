
Pod::Spec.new do |s|
  s.name         = "YRLayoutConstraint"
  s.version      = “0.0.2”
  s.summary      = "simple Custom NSLayoutConstraint."
  s.description  = "simple Custom NSLayoutConstraint."
  #s.homepage     = "https://github.com/HMWDavid/YRLayoutConstraint"
  s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "洪绵卫" => "244160918@qq.com" }
  s.platform     = :ios, "7.0"
  s.ios.deployment_target = "7.0"
  s.source       = { :git => "http://EXAMPLE/YRLayoutConstraint.git", :tag => “0.0.2” }
  s.source_files  = "YRLayoutConstraint/**/UIView+YRLayoutConstraint.{h,m}"
  s.requires_arc = true
end
