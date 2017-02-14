# encoding: UTF-8
module Bos
  class << self

    def buckets
      list_buckets unless @result
      @result[:buckets].map { |bk| Bucket.new bk }
    end

    def owner
      list_buckets unless @result
      @result[:owner]
    end

    private
    def list_buckets
      url = host.to_s
      request = Bos::Request.new url, method: :get
      response = request.run
      @result = response[:data]
    end
  end
end
