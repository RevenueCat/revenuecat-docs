class Error
    attr_reader :response_code, :name, :message, :suggestion, :docs, :help, :poem

    def initialize(response_code, name, message, suggestion, docs, help, poem)
        @response_code = response_code
        @name = name
        @message = message
        @suggestion = suggestion
        @docs = docs
        @help = help
        @poem = poem
    end

    def self.from_json(json, response_code)
        Error.new(
            response_code,
            json["error"],
            json["message"],
            json["suggestion"],
            json["docs"],
            json["help"],
            json["poem"]
        )
    end

    def to_s
        <<~STRING
            Response Code: #{@response_code}
            Name: #{@name}
            Message: #{@message}
            Suggestion: #{@suggestion}
            Docs: #{@docs}
            Help: #{@help}
            Poem: #{@poem}
        STRING
    end
end
