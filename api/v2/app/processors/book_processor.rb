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

  def update(book_options)
  end

  def read(book_options)
  end
end
