require 'application_system_test_case'

class LinksTest < ApplicationSystemTestCase
  setup do
    @link = links(:one)
  end

  test 'visiting the index' do
    visit links_url
    assert_selector 'h1', text: 'Links'
  end

  test 'should create Link' do
    visit links_url
    click_on 'New Link'

    fill_in 'Clicked', with: @link.clicked
    fill_in 'Comment', with: @link.comment
    fill_in 'Slug', with: @link.slug
    fill_in 'Url', with: @link.url
    click_on 'Create Link'

    assert_text 'Link was successfully created'
    click_on 'Back'
  end

  test 'should update Link' do
    visit links_url
    click_on 'Edit', match: :first

    fill_in 'Clicked', with: @link.clicked
    fill_in 'Comment', with: @link.comment
    fill_in 'Slug', with: @link.slug
    fill_in 'Url', with: @link.url
    click_on 'Update Link'

    assert_text 'Link was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Link' do
    visit links_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Link was successfully destroyed'
  end
end
