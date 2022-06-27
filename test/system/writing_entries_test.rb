require 'application_system_test_case'

class WritingEntriesTest < ApplicationSystemTestCase
  setup do
    @writing_entry = writing_entries(:one)
  end

  test 'visiting the index' do
    visit writing_entries_url
    assert_selector 'h1', text: 'Writing entries'
  end

  test 'should create writing entry' do
    visit writing_entries_url
    click_on 'New writing entry'

    fill_in 'Comment', with: @writing_entry.comment
    fill_in 'Count', with: @writing_entry.count
    fill_in 'Wrote on', with: @writing_entry.wrote_on
    click_on 'Create Writing entry'

    assert_text 'Writing entry was successfully created'
    click_on 'Back'
  end

  test 'should update Writing entry' do
    visit writing_entry_url(@writing_entry)
    click_on 'Edit this writing entry', match: :first

    fill_in 'Comment', with: @writing_entry.comment
    fill_in 'Count', with: @writing_entry.count
    fill_in 'Wrote on', with: @writing_entry.wrote_on
    click_on 'Update Writing entry'

    assert_text 'Writing entry was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Writing entry' do
    visit writing_entry_url(@writing_entry)
    click_on 'Destroy this writing entry', match: :first

    assert_text 'Writing entry was successfully destroyed'
  end
end
