module Wemo
  class Radar
    attr_accessor :device_type, :repository

    def initialize(device_type = "urn:Belkin:device:controllee:1", repository = Wemo::Repository)
      @device_type = device_type
      @repository = repository
    end

    def scan
      locations.map do |location|
        begin
          repository.add Wemo::Switch.new(location)
        rescue => e
          bad_locations[location] = e
        end
      end
    end

    def bad_locations
      @bad_locations ||= {}
    end

    private

    def locations
      Frisky::SSDP.search(device_type).uniq.map { |attrs| without_path(attrs[:location]) }
    end

    def without_path(uri)
      uri.gsub %r(/[^/]*$), ""
    end
  end
end
