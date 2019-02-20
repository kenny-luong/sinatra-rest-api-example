class BookStorageMysql
  def initialize(storage)
    @storage = storage
  end

  def all
    @storage.all
  end

  def find(id)
    @storage.find(id)
  end

  def insert(options)
  end
end
