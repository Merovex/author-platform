class EmailsController < ApplicationController
  def unsubscribe
    user = User.find_by_unsubscribe_hash(params[:unsubscribe_hash])

    case params[:subscription]
      when "new_posts_sent"
        @reason = "receiving new posts"
        user.update(notify_when_broadcast_post: false)
      when "added_to_project"
        @reason = "being added to projects"
        # user.update(notify_when_added_to_project: false)
      when "new_checkins_sent"
        @reason = "recieving progress updates"
        # user.update(notify_when_added_to_project: false)
      when "task_created"
        @reason = "new tasks"
        # user.update(notify_when_task_created: false)
      when "task_completed"
        @reason = "completing tasks"
        # user.update(notify_when_task_completed: false)
      end
    user.save
  end
end
