class JSONRPCServer
    attr_reader :listen_port, :server

    def listen
      @server = TCPServer.new("127.0.0.1", @configuration["receive_port"])
    end

    def connect(ip, port)
      @client = TCPSocket.open(ip, port)
    end

end
