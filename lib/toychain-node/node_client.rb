require 'json'
require 'jimson'
require 'toychain-data_structures'
require 'pry'

module ToyChain
  class NodeClient
    attr_reader :message_pool, :configuration, :server

    def initialize(config_file:)
      @message_pool = MessagePool.new
      read_config(config_file)
    end

    def read_config(file_path)
      contents = File.open(file_path, 'r').read
      @configuration = JSON.parse(contents)
    end

    def listen
      @server = TCPServer.new("127.0.0.1", @configuration["receive_port"])
    end

    def connect(ip, port)
      @client = TCPSocket.open(ip, port)
    end


  end
end

