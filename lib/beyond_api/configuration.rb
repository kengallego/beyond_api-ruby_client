module BeyondApi
  class Configuration
    attr_accessor :client_id, :client_secret,
                  :open_timeout, :timeout,
                  :log_headers, :log_bodies, :log_level,
                  :all_pagination_size, :retry_options

    def initialize
      @client_id = nil
      @client_secret = nil
      @open_timeout = 2
      @timeout = 5

      @log_level = :info
      @log_headers = false
      @log_bodies = false

      @all_pagination_size = 200

      @retry_options = {
        max: 3,
        interval: 0.05,
        interval_randomness: 0.5,
        backoff_factor: 2,
        retry_statuses: [409],
        exceptions: [Faraday::TimeoutError, Faraday::ConnectionFailed]
      }
    end
  end
end
