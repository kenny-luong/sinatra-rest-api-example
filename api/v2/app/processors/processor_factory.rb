class ProcessorFactory
  attr_reader :application_processor, :book_processor
  require 'yaml'

  # Configuration handler options.
  MYSQL = 'mysql'
  MOCK = 'mock'

  # Lazily initialize the db connection in case it is not actually used.
  def initialize(config)
    dependencies = {}
    case config['handlers']['book_storage']
    when ProcessorFactory::MYSQL
      dependencies[:database] = MysqlGateway.new(config['external_services']['mysql'])
      dependencies[:sample] = SampleGateway.new(config)
      book_storage = BookStorageMysql.new(dependencies[:database].accessor[:books])
    when ProcessorFactory::MOCK
      book_storage = BookStorageMock.new({})
    else
      raise RuntimeError.new(
        'Unimplemented bookStorage ' + config['handlers']['book_storage']
      )
    end

    @book_processor = BookProcessor.new(book_storage)
    @application_processor = ApplicationProcessor.new(dependencies)
  end
end
