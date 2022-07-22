# frozen_string_literal: true

class SeriesListComponent < ViewComponent::Base
  include ApplicationHelper
  include BooksHelper
  def initialize(series:, title:)
    # Title is a template string, like 'Series: %{title}'
    @title = title

    @series = series
    @books = @series.books.published.sort_by(&:position)
  end
end
