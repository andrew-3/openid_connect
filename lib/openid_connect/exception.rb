module OpenIDConnect
  class Exception < StandardError; end

  class HttpError < Exception
    attr_accessor :status, :response
    def initialize(status, message, response = nil)
      @status = status
      @message = message
      @response = response
    end
  end

  class BadRequest < HttpError
    def initialize(message, response = nil)
      super 400, message, response
    end
  end

  class Unauthorized < HttpError
    def initialize(message, response = nil)
      super 401, message, response
    end
  end

  class Forbidden < HttpError
    def initialize(message, response = nil)
      super 403, message, response
    end
  end
end