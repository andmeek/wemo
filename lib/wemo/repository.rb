module Wemo
  module Repository
    extend self

    def empty?
      devices.empty?
    end

    def add(device)
      index = devices.find_index { |d| d.location == device.location }
      if index.nil?
        devices << device
      else
        devices[index] = device
      end
    end

    def devices
      @devices ||= []
    end

    def clear
      @devices.delete_if { true }
    end
  end
end
