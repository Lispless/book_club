require 'rails_helper'

feature 'User creates and views review' do
  scenario 'Display books in index' do
    book = FactoryGirl.build(:book)
    review = FactoryGirl.build(:review)
    visit '/books'
    click_link 'Add a book'
    fill_in 'Title of book', with: book.title
    fill_in 'Author of book', with: book.author
    fill_in 'Year printed', with: book.year
    click_button 'Submit'
    click_link book.title
    fill_in 'On a scale of 1 - 5, please rate this book.', with: review.rating
    fill_in 'Add a comment or some such', with: review.body
    click_button 'Submit'
    expect(page).to have_content(review.rating)
  end

  scenario 'User fails to make review' do
    book = FactoryGirl.build(:book)
    review = FactoryGirl.build(:review)
    visit '/books'
    click_link 'Add a book'
    fill_in 'Title of book', with: book.title
    fill_in 'Author of book', with: book.author
    fill_in 'Year printed', with: book.year
    click_button 'Submit'
    click_link book.title
    click_button 'Submit'
    expect(page).to have_content('Review did not go through!')
  end
end
