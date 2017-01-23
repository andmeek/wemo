require "bundler/setup"
require "thor"
require_relative "lib/wemo"

class Default < Thor
  desc "list_devices", "List available WeMo devices"
  def list_devices
    Wemo::Radar.new("urn:Belkin:device:controllee:1", Wemo::Repository).scan

    say
    say "Found #{Wemo::Repository.devices.length} devices"
    say

    table = Wemo::Repository.devices.map do |device|
      [device.name, device.location, device.on? ? "On" : "Off"]
    end

    print_table [["Name", "URL", "State"]] + table
  end

  desc "turn_on", "Turn on all devices"
  def turn_on
    Wemo::Radar.new("urn:Belkin:device:controllee:1", Wemo::Repository).scan

    Wemo::Repository.devices.each do |device|
      device.on!
    end
  end

  desc "turn_off", "Turn off all devices"
  def turn_off
    Wemo::Radar.new("urn:Belkin:device:controllee:1", Wemo::Repository).scan

    Wemo::Repository.devices.each do |device|
      device.off!
    end
  end
end
