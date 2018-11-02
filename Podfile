# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
use_frameworks!

target 'ItunesReader' do
    platform :ios, '9.0'
    pod 'SDWebImage'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = ‘4.0’
        end
    end
end
