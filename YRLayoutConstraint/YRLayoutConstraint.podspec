
Pod::Spec.new do |s|
  s.name         = "YRLayoutConstraint"
  s.version      = “1.0.1”
  s.summary      = "simple Custom NSLayoutConstraint."
  s.description  = "simple Custom NSLayoutConstraint."
  #s.homepage     = "https://github.com/HMWDavid/YRLayoutConstraint"
  s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "洪绵卫" => "244160918@qq.com" }
  s.platform     = :ios, "7.0"
  s.ios.deployment_target = "7.0"
  s.source       = { :git => "http://EXAMPLE/YRLayoutConstraint.git", :tag => “1.0.1” }
  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"
  s.requires_arc = true
end
