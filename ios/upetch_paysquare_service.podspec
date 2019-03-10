#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'upetch_paysquare_service'
  s.version          = '0.0.2'
  s.summary          = 'A Flutter plugin for RazorPay SDK'
  s.description      = <<-DESC
A new Flutter plugin.
                       DESC
  s.homepage         = 'https://github.com/pritish12/upetch_paysquare_service'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'razorpay-pod', '1.0.28'
  
  s.ios.deployment_target = '11.0'
end

#Pod::Spec.new do |s|
#  s.name             = 'flutter_razorpay_plugin'
#  s.version          = '0.0.1'
#  s.summary          = 'A new Flutter plugin.'
#  s.description      = <<-DESC
#  A new Flutter plugin.
#  DESC
#  s.homepage         = 'https://github.com/pritish12/upetch_paysquare_service'
#  s.license          = { :file => '../LICENSE' }
#  s.author           = { 'Pritish Sawant' => 'pritish.sawant@upetch.com' }
#  s.source           = { :path => '.' }
#  s.source_files = 'Classes/**/*'
#  s.public_header_files = 'Classes/**/*.h'
#  s.dependency 'Flutter'
#  s.dependency 'razorpay-pod', '1.0.28'
#
#  s.ios.deployment_target = '11.0'
#end
