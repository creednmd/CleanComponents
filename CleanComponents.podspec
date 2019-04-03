Pod::Spec.new do |spec|

  spec.name         = "CleanComponents"
  spec.version      = "0.0.1"
  spec.summary      = 'Component creation for the iOS Clean Swift (VIP) Architecture.'

  spec.description  = <<-DESC
  Creates components for @rayvinly's iOS Clean Swift (VIP) Architecture.
  Contains Factory Methods for creating View Controllers, Interactors, Presenters, Workers, Routers, Models, plus setup of the VIP Cycle that ties them together.
  For more details on the Clean Swift (VIP) Architecture see https://clean-swift.com/
                  DESC

  spec.homepage     = "https://github.com/creednmd/CleanComponents"
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }

  spec.author            = { "Andy Warwick" => "andy.w@creed.co.uk" }
  spec.social_media_url   = "https://twitter.com/creednmd"

  spec.platform              = :ios, "5.0"
  spec.swift_version         = '5.0'
  spec.ios.deployment_target = "11.4"

  spec.source       = { :git => "https://github.com/creednmd/CleanComponents.git", :tag => "#{spec.version}" }
  spec.source_files  = "CleanComponents/**/*.{h,m,swift}"

end
