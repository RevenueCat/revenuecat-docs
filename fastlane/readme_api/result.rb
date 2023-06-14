class Result
    attr_reader :value, :error

    def initialize(value = nil, error = nil)
        @value = value
        @error = error
    end

    def success?
        !@value.nil?
    end

    def failure?
        !@error.nil?
    end
end
