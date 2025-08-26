Pod::Spec.new do |spec|
  spec.name         = "PaddleApi"
  spec.version      = "0.0.1"
  spec.summary      = "A lightweight API wrapper for Paddle SDK."
  spec.description  = <<-DESC
PaddleApi is a Swift library for integrating the Paddle SDK.
DESC
  spec.homepage     = "https://github.com/Ruoyu05/PaddleApi"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Ruoyu" => "xyhuyumao@gmail.com" }
  spec.source       = { :git => "https://github.com/Ruoyu05/PaddleApi.git", :tag => spec.version.to_s }
  spec.source_files = "Sources/**/*.swift"
  spec.exclude_files = "Classes/Exclude/**/*"
  spec.requires_arc = true
  spec.platform     = :ios, "18.0"
end
