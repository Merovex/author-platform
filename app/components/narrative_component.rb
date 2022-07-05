# frozen_string_literal: true

class NarrativeComponent < ViewComponent::Base
  include LocalTimeHelper
  include ApplicationHelper
  include UsersHelper
  include Turbo::FramesHelper
  def initialize(parent:, object:, hide_metadata:false, verb:"said")
    @object = object
    @verb = verb
    @id = @object.id ? dom_id(@object) : 'narrative-form'
    @datetime = @object.updated_at.nil? ? @object.created_at : @object.updated_at
    @edit_text = @object.updated_at.nil? ? '' : 'Edited'
  end

  def content_or_new_link(object)
    return object.content if object.id
  end
end
