class ApplicationProcessor
  def initialize(storage)
    @storage = storage
  end

  def healthcheck
    @storage.test_connection ? "passed" : "failed"
  rescue
    "failed"
  end
end
