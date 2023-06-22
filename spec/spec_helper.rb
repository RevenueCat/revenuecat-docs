# This module is only used to check the environment is currently a testing env
module SpecHelper
end

require 'fastlane' # to import the Action super class

Fastlane.load_actions # load other actions (in case your plugin calls other actions or shared values)