Pod::Spec.new do |s|
  s.name         = "UIColor+ContrastingColor"
  s.version      = "0.0.1"
  s.summary      = "Returns either black or white based on the contrast against the current colour."

  s.description  = <<-DESC
  UIColor+ContrastColor
  =====================

  Returns either black or white based on the contrast against the current colour.

  There are currently two options for determining which colour to use: the 50% method, or the YIQ method.

  ## The 50% Method
  #The self colour is converted to hex then checked if it is >= 0x808080. If the colour is >= 0x808080 then black colour is returned, otherwise white colour is returned.
  #
  ### The YIQ method
  #The YIQ method is arguably better as it applies weighting to the colours, which could result in better contrast matches.
  #
  #![Screenshot](https://raw.githubusercontent.com/squarefrog/UIColor-ContrastColor/master/screenshot.png)
                   DESC

  s.homepage     = "https://github.com/squarefrog/UIColor-ContrastColor/"
  s.screenshots  = "https://raw.githubusercontent.com/squarefrog/UIColor-ContrastColor/master/screenshot.png"
  s.license      = "MIT"
  s.author             = { "Paul Williamson" => "squarefrog@gmail.com" }
  s.social_media_url   = "http://twitter.com/squarefrog"
  s.platform     = :ios, "5.0"
  s.source       = { :git => "https://github.com/squarefrog/UIColor-ContrastColor.git", :tag => "0.0.1" }
  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.requires_arc = true
end
