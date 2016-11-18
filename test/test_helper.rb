require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/hell'

lib = File.expand_path('../../lib/toychain-node/', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Minitest::Reporters.use! Minitest::Reporters::DefaultReporter.new({detailed_skip: false})
