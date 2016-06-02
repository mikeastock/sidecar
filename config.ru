# Load path and gems/bundler
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "dotenv"
Dotenv.load

# Load app
require "sidecar"
run Sidecar::App
