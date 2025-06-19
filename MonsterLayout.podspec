Pod::Spec.new do |s|
  s.name         = "MonsterLayout"
  s.version      = "1.0.0"
  s.author       = "KnightSama"
  s.summary      = "用尽可能少的代码完成 iOS AutoLayout 布局"
  s.description  = <<-EOS
  用尽可能少的代码完成 iOS AutoLayout 布局
  EOS

  s.homepage     = "https://github.com/KnightSama/MonsterLayout"
  s.source       = { :git => "https://github.com/KnightSama/MonsterLayout.git", :tag => s.version }
  s.license      = { :type => "MIT", :file => "License.md" }

  s.ios.deployment_target = '13.0'
  s.osx.deployment_target = '10.12'

  s.swift_version = '5.3'
  s.cocoapods_version = '>= 1.4.0'

  s.source_files  = "Sources/*.swift"
end
