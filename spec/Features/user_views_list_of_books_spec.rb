require 'rails_helper'

feature 'User creates and views books' do
  scenario 'Display books in index' do
    book = FactoryGirl.build(:book)
    book2 = FactoryGirl.build(:book)
    visit '/books'
    click_link 'Add a book'
    fill_in 'Title of book', with: book.title
    fill_in 'Author of book', with: book.author
    fill_in 'Year printed', with: book.year
    click_button 'Submit'
    expect(page).to have_content(book.title)
    expect(page).to have_content(book2.title)
  end

  scenario 'User fails to make book' do
    visit '/books'
    click_link 'Add a book'
    click_button 'Submit'
    expect(page).to have_content('Title can\'t be blank')
    expect(page).to have_content('Author can\'t be blank')
    expect(page).to have_content('Year can\'t be blank')
  end
end
