class ProcessorFactory
  attr_reader :application_processor, :book_processor
  require 'yaml'

  # Configuration handler options.
  MYSQL = 'mysql'
  MOCK = 'mock'

  # Lazily initialize the db connection in case it is not actually used.
  def initialize(config)
    case config['handlers']['bookStorage']
    when ProcessorFactory::MYSQL
      db = MysqlGateway.new(config['externalServices']['mysql']).accessor
      book_storage = BookStorageMysql.new(db[:books])
    when ProcessorFactory::MOCK
      book_storage = BookStorageMock.new({})
    else
      raise RuntimeError.new(
        'Unimplemented bookStorage ' + config['handlers']['bookStorage']
      )
    end

    @book_processor = BookProcessor.new(book_storage)
    @application_processor = ApplicationProcessor.new(healthchecks)
  end

  private

  def get_db(mysql_creds)
  end

  class DependencyContainer < Struct.new(:storage)
  end
end
