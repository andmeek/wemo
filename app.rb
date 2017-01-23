require "bundler/setup"
require "sinatra/base"
require "frisky/ssdp"
require "net/http"
require "uri"
require "active_support/all"
require "i18n"
require "pry"
require_relative "lib/wemo"

module Wemo
  class Application < Sinatra::Base
    get "/" do
      erb :index
    end

    post "/wemos/:uuid/:state" do
      wemo = Wemo::Switch.find(params[:uuid])
      wemo.set! params[:state]
      status 200
    end

    helpers do
      def wemos
        scan if Repository.empty?
        Repository.devices
      end

      def scan
        Wemo::Radar.new("urn:Belkin:device:controllee:1", Repository).scan
      end
    end
  end
end
