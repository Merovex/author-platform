# frozen_string_literal: true

class BreadcrumbComponent < ViewComponent::Base
  def initialize
    @svg = <<-SVG
    <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5 mx-4 fill-gray-500" viewBox="0 0 16 16" fill="currentColor">
      <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
    </svg>
    SVG
  end
end
