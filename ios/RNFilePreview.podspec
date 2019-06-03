
Pod::Spec.new do |s|
  s.name = 'RNFilePreview'
  s.version = '0.0.1'
  s.license = 'MIT'
  s.summary = 'A lightweight library to preview iOS documents.'
  s.homepage = 'https://github.com/wangrq/react-native-file-preview'
  s.authors = { 'Renquan Wang' => 'wangrqt196@gmail.com' }
  s.source = { :git => 'https://github.com/wangrq/react-native-file-preview', :tag => s.version }
  s.ios.deployment_target = '8.0'
  s.ios.frameworks = 'UIKit', 'Foundation'
  s.source_files = './**/*.swift'
  s.resource_bundles = {
    'RNFilePreview' => ['./**/*.xcassets']
  }
  s.requires_arc = true
  s.swift_version = '5.0'
  s.dependency "React"
end

