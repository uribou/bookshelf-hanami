require 'features_helper'

RSpec.describe 'Add book' do
  let(:repo) { BookRepository.new }

  it 'can create a book' do
    visit '/books/new'

    within 'form#book-form' do
      fill_in 'Title', with: 'New Book'
      fill_in 'Author', with: 'Some Author'

      click_button 'Create'
    end

    expect(page).to have_current_path('/books')
    expect(page).to have_content('New Book')
  end

  context 'when params contains errors' do
    it 'displays list of errors' do
      visit '/books/new'

      within 'form#book-form' do
        click_button 'Create'
      end

      expect(current_path).to eq('/books')

      expect(page).to have_content('There was a problem with your submission')
      expect(page).to have_content('Title must be filled')
      expect(page).to have_content('Author must be filled')
    end
  end
end
