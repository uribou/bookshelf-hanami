RSpec.describe Book do
  it 'can be initialized with attributes' do
    book = Book.new(title: 'Refactoring', author: 'Martin')
    expect(book.title).to eq('Refactoring')
    expect(book.author).to eq('Martin')
  end
end
