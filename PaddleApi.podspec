Pod::Spec.new do |s|
  s.name             = 'PaddleApi'
  s.version          = '0.0.1'
  s.ios.deployment_target = '18.0'
  s.swift_versions   = ['5.0']
  s.summary          = 'A lightweight API wrapper for Paddle SDK.'
  s.description      = <<-DESC
PaddleApi is a Swift library for integrating the Paddle SDK.
DESC
  s.homepage         = 'https://github.com/Ruoyu05/PaddleApi'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ruoyu05' => 'xyhuyumao@gmail.com' }
  s.source           = { :git => 'https://github.com/Ruoyu05/PaddleApi.git', :tag => s.version.to_s }

  # 让 Pod 支持 Swift + Objective-C
  s.source_files     = 'PaddleApi/Classes/**/*.{swift,h,m}', 'PaddleApi/Private/**/*.h'
  s.public_header_files = 'PaddleApi/Classes/**/*.h'
end
