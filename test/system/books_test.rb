require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: 'Books'
  end

  test 'should create Book' do
    visit books_url
    click_on 'New Book'

    check 'Is featured' if @book.is_featured
    fill_in 'Released on', with: @book.released_on
    fill_in 'Slug', with: @book.slug
    # fill_in 'Synopsis', with: @book.synopsis
    fill_in 'Title', with: @book.title
    click_on 'Create Book'

    assert_text 'Book was successfully created'
    click_on 'Back'
  end

  test 'should update Book' do
    visit books_url
    click_on 'Edit', match: :first

    check 'Is featured' if @book.is_featured
    fill_in 'Released on', with: @book.released_on
    fill_in 'Slug', with: @book.slug
    fill_in 'Synopsis', with: @book.synopsis
    fill_in 'Title', with: @book.title
    click_on 'Update Book'

    assert_text 'Book was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Book' do
    visit books_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Book was successfully destroyed'
  end
end
