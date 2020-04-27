Pod::Spec.new do |spec|

  spec.name         = "Braspag3Ds"
  spec.version      = "1.0.1"
  spec.summary      = "Biblioteca de validação de cartões de crédito"

  spec.description  = <<-DESC
  Biblioteca Cielo/Braspag de validação de cartões de crédito utilizando o método 3DS.
                   DESC

  spec.homepage     = "https://github.com/DeveloperCielo/3ds-ios"

  spec.license      = "MIT"
  # spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }


  spec.author             = { "Jeferson F. Nazario" => "jefnazario@gmail.com" }
  # Or just: spec.author    = "Jeferson F. Nazario"
  # spec.authors            = { "Jeferson F. Nazario" => "jefnazario@gmail.com" }
  spec.social_media_url   = "https://twitter.com/jefnazario"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.platform     = :ios, "9.0"

  spec.source       = { :git => "https://github.com/DeveloperCielo/3ds-ios.git", :tag => "v#{spec.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.source_files  = "*.*"
  spec.exclude_files = "Example3ds/*.*"
end
