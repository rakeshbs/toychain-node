require_relative 'test_helper.rb'
require 'toychain-data_structures'
require 'node_server.rb'
require 'json'

module ToyChain
  class TestNode < Minitest::Test

    def setup
      @message_pool = MessagePool
      @node = NodeServer
      config_file = './lib/toychain-node/node_config.json'
      contents = File.open(config_file, 'r').read
      @configuration = JSON.parse(contents)
      @n = @node.new(config_file: config_file)
      @thread = Thread.new do
        @n.start
      end
    end

    def teardown()
      Thread.kill(@thread)
    end

    def test_create
      assert @n
    end

    def test_node_check_message_pool
      assert_equal @n.message_pool.class, @message_pool
    end

    def test_node_loads_configuration
      assert @n.configuration
    end

    def test_node_server_connectable
      client = Jimson::Client.new('http://0.0.0.0:234')
      assert client
    end

  end
end
