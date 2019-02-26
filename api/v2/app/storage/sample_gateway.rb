class SampleGateway
  attr_reader :accessor

  def initialize(config)
    @accessor = "Sample Accessor"
  end

  def healthcheck
    "passed"
  end
end
