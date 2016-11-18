require 'json'
require 'jimson'
require 'toychain-data_structures'
module ToyChain
  class NodeServer
    attr_reader :message_pool, :configuration, :server

    def initialize(config_file:)
      @message_pool = MessagePool.new
      read_config(config_file)
      @server = Jimson::Server.new(nil, {host: @configuration['host'],
                                         port: @configuration['receive_port']})
    end

    def read_config(file_path)
      contents = File.open(file_path, 'r').read
      @configuration = JSON.parse(contents)
    end

    def start
      @server.start
    end



  end
end

