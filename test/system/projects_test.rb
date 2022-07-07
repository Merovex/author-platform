require 'application_system_test_case'

class WritingGoalsTest < ApplicationSystemTestCase
  setup do
    @project = projects(:one)
  end

  test 'visiting the index' do
    visit projects_url
    assert_selector 'h1', text: 'Writing goals'
  end

  test 'should create writing goal' do
    visit projects_url
    click_on 'New writing goal'

    fill_in 'Book', with: @project.book_id
    fill_in 'Finish on', with: @project.finish_on
    fill_in 'Start on', with: @project.start_on
    fill_in 'Summary', with: @project.summary
    fill_in 'Target', with: @project.target
    click_on 'Create Writing goal'

    assert_text 'Writing goal was successfully created'
    click_on 'Back'
  end

  test 'should update Writing goal' do
    visit project_url(@project)
    click_on 'Edit this writing goal', match: :first

    fill_in 'Book', with: @project.book_id
    fill_in 'Finish on', with: @project.finish_on
    fill_in 'Start on', with: @project.start_on
    fill_in 'Summary', with: @project.summary
    fill_in 'Target', with: @project.target
    click_on 'Update Writing goal'

    assert_text 'Writing goal was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Writing goal' do
    visit project_url(@project)
    click_on 'Destroy this writing goal', match: :first

    assert_text 'Writing goal was successfully destroyed'
  end
end
