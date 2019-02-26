class MysqlGateway
  attr_reader :accessor

  def initialize(config)
    @accessor = connect(config)
  end

  def healthcheck
    @accessor.test_connection ? 'passed' : 'failed' rescue 'failed'
  end

  private

  def connect(config)
    Sequel.connect({
      :adapter  => config['adapter'],
      :user     => config['username'],
      :host     => config['host'],
      :database => config['database'],
      :password => config['password']
    })
  end
end
