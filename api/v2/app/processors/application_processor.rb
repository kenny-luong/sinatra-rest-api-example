class ApplicationProcessor
  def initialize(dependencies)
    @dependencies = dependencies
  end

  def healthcheck
    statuses = {}
    begin
      @dependencies.each do |name, obj|
        statuses[name] = obj.healthcheck
      end
    rescue
      "failed"
    end
    statuses
  end
end
