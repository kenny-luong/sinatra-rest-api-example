class ProcessorFactory
  attr_reader :book_processor
  require 'yaml'

  def initialize(config)
    # Eventually will be a case statement
    #

    # TODO: Abstract
    connection_options = YAML.load_file("config/database.yml")

    mysql_creds = connection_options["external_services"]["mysql"]["mysql_credentials"]

    db = Sequel.connect({
        :adapter  => mysql_creds['adapter'],
        :user     => mysql_creds['username'],
        :host     => mysql_creds['host'],
        :database => mysql_creds['database'],
        :password => mysql_creds['password']
    })

    book_storage = BookStorageMysql.new(db[:books])

    @book_processor = BookProcessor.new(book_storage)

  end
end
