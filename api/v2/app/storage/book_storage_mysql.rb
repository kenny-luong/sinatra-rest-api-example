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
    @storage.insert(options)
  end

  def update(id, options)
    @storage.where(id: id).update(options)
  end

  def destroy(id)
    @storage.where(id: id).delete
  end

    @storage.test_connection ? "passed" : "failed"
end
