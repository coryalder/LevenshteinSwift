#
# Be sure to run `pod lib lint LevenshteinSwift.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "LevenshteinSwift"
  s.version          = "1.0.1"
  s.summary          = "Compute Levenshtein string distances using Swift."
  s.description      = <<-DESC
                       [Levenshtein distance](https://en.wikipedia.org/wiki/Levenshtein_distance) is a measure of the difference between two strings. It can be used for fuzzy searching, among other things. This is an implementation in Swift 1.2, based on Mark Aufflick's Objective-C "NSString+Levenshtein".
                       DESC
  s.homepage         = "https://github.com/coryalder/LevenshteinSwift"
  s.license          = 'MIT'
  s.author           = { "Cory Alder" => "cory@davander.com" }
  s.source           = { :git => "https://github.com/coryalder/LevenshteinSwift.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/corydmc'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'LevenshteinSwift.swift'
  s.frameworks = 'Foundation'
end
