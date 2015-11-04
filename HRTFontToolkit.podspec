Pod::Spec.new do |s|
  s.name         = "HRTFontToolkit"
  s.version      = "0.0.1"
  s.summary      = "UIFont相关的操作."
  s.homepage     = "http://github.com/hirat"
  s.license      = "MIT"
  s.author       = { "Hirat" => "hirats@gmail.com" }
  s.source       = { :git => "git@github.com:hirat/HRTFontToolkit.git"}
  s.source_files  = "HRTFontToolkit/*.{h,m}"    
  s.public_header_files = "HRTFontToolkit/HRTFontToolkit.h"
  s.resources  = "HRTFontToolkit/**/*.{bundle,storyboard}"  

  s.subspec 'UIKit' do |uikit|
    uikit.source_files = 'HRTFontToolkit/UIKit/*.{h,m}'    
  end

end
