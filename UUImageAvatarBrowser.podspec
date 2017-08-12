#
#  Be sure to run `pod spec lint UUImageAvatarBrowser.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "UUImageAvatarBrowser"
  s.version      = "0.0.1"
  s.summary      = "测试UUImageAvatarBrowser."


  s.description  = <<-DESC
                  我就是测试一下。没别的意思
                   DESC

  s.homepage     = "https://github.com/sunyafeng1990/UIImageTest"
  

  # s.license      = "MIT (example)"
  s.license      = { :type => "MIT", :file => "LICENSE" }


  s.author             = { "孙亚锋" => "781080582@qq.com" }
  

   s.platform     = :ios, "8.0"


  s.source       = { :git => "https://github.com/sunyafeng1990/UIImageTest.git", :tag => "0.0.1" }



  s.source_files  = "testOne", "testOne/UUImageAvatarBrowser/**/*.{h,m}"
 

  

  s.framework  = "UIKit"


  s.requires_arc = true


end
