require 'book_repository'
def reset_books_table
    seed_sql = File.read('spec/seeds_books.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
    connection.exec(seed_sql)
  end
  
  describe BookRepository do
    before(:each) do 
      reset_books_table
    end

    it "lists all books" do
        repo = BookRepository.new
        books = repo.all
  
        expect(books.length).to eq 2

        expect(books[0].id).to eq '1'
        expect(books[0].title).to eq 'Pride and Prejudice'
        expect(books[0].author_name).to eq 'Jane Austen'

        expect(books[1].id).to eq '2'
        expect(books[1].title).to eq 'Far From The Madding Crowd'
        expect(books[1].author_name).to eq 'Thomas Hardy'

    end
  
  end