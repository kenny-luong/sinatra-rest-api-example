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
      :adapter  => mysql_creds['adapter'],
      :user     => mysql_creds['username'],
      :host     => mysql_creds['host'],
      :database => mysql_creds['database'],
      :password => mysql_creds['password']
    })
  end
end
