require 'application_system_test_case'

class AuthorsTest < ApplicationSystemTestCase
  setup do
    @author = authors(:one)
  end

  test 'visiting the index' do
    visit authors_url
    assert_selector 'h1', text: 'Authors'
  end

  test 'should create Author' do
    visit authors_url
    click_on 'New Author'

    fill_in 'Book', with: @author.book_id
    fill_in 'Summary', with: @author.summary
    fill_in 'User', with: @author.user_id
    click_on 'Create Author'

    assert_text 'Author was successfully created'
    click_on 'Back'
  end

  test 'should update Author' do
    visit authors_url
    click_on 'Edit', match: :first

    fill_in 'Book', with: @author.book_id
    fill_in 'Summary', with: @author.summary
    fill_in 'User', with: @author.user_id
    click_on 'Update Author'

    assert_text 'Author was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Author' do
    visit authors_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Author was successfully destroyed'
  end
end
