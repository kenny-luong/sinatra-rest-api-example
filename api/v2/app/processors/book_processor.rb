class BookProcessor
  def initialize(storage)
    @storage = storage
  end

  def all
    @storage.all
  end

  def find(id)
    @storage.find(id).first
  end

  def create(book_options)
    @storage.insert(book_options)
  end

  def update(id, book_options)
    @storage.update(id, book_options)
  end

  def destroy(id)
    @storage.destroy(id)
  end
end
