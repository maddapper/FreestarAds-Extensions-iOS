Pod::Spec.new do |s|

  s.name             = 'FreestarAds-Extensions'
  s.version          = '1.0.0'
  s.summary          = 'FreestarAds Extensions SDK.'
  s.description      = "Provides alternative APIs to FreestarAds SDK for iOS."
  s.homepage         = 'https://freestar.io'
  s.author           = { 'Freestar - Dean Chang' => 'dean.chang@freestar.io' }
  s.license          = { :type => 'Freestar Limited License' }
  s.platform         = :ios, '9.0'
  s.source           = { :git => 'https://github.com/maddapper/FreestarAds-Extensions-iOS.git', :tag => s.version.to_s }
  s.swift_version    = '5.0'

  s.source_files = 'build/FreestarAds_Extensions.framework/Headers/*.{h}'
  s.vendored_frameworks = 'build/FreestarAds_Extensions.framework'
  s.preserve_paths =  'build/FreestarAds_Extensions.framework/*'
  s..dependency 'FreestarAds', '~> 3.2.5'

end
