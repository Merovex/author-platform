require 'application_system_test_case'

class WritingGoalsTest < ApplicationSystemTestCase
  setup do
    @bucket = buckets(:one)
  end

  test 'visiting the index' do
    visit buckets_url
    assert_selector 'h1', text: 'Writing goals'
  end

  test 'should create writing goal' do
    visit buckets_url
    click_on 'New writing goal'

    fill_in 'Book', with: @bucket.book_id
    fill_in 'Finish on', with: @bucket.finish_on
    fill_in 'Start on', with: @bucket.start_on
    fill_in 'Summary', with: @bucket.summary
    fill_in 'Target', with: @bucket.target
    click_on 'Create Writing goal'

    assert_text 'Writing goal was successfully created'
    click_on 'Back'
  end

  test 'should update Writing goal' do
    visit bucket_url(@bucket)
    click_on 'Edit this writing goal', match: :first

    fill_in 'Book', with: @bucket.book_id
    fill_in 'Finish on', with: @bucket.finish_on
    fill_in 'Start on', with: @bucket.start_on
    fill_in 'Summary', with: @bucket.summary
    fill_in 'Target', with: @bucket.target
    click_on 'Update Writing goal'

    assert_text 'Writing goal was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Writing goal' do
    visit bucket_url(@bucket)
    click_on 'Destroy this writing goal', match: :first

    assert_text 'Writing goal was successfully destroyed'
  end
end
