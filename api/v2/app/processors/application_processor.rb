class ApplicationProcessor
  def initialize(dependencies)
    @dependencies = dependencies
  end

  def healthcheck
    statuses = {}
    begin
      @dependencies.each do |name, healthcheck|
        statuses[name] = healthcheck.call
      end
    rescue
      "failed"
    end
    statuses
  end
end
