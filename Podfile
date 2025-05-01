workspace 'ComponentsApp1'
platform :ios, '14.0'
use_frameworks!

CCPod = Struct.new(:name, :version)

SwiftLint = CCPod.new('SwiftLint', '0.47.1')
SwiftFormat = CCPod.new('SwiftFormat/CLI', '0.49')

target 'ComponentsApp1' do
  pod SwiftLint.name, SwiftLint.version
  pod SwiftFormat.name, SwiftFormat.version
end

target 'Tutorial' do
  project 'Features/Tutorial/Tutorial'
  use_frameworks!
  
  target 'TutorialTests' do
    inherit! :search_paths
    use_frameworks!
    pod 'SnapshotTesting', '~> 1.9.0'
  end
end
