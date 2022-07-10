# == Route Map
#
#                                   Prefix Verb   URI Pattern                                                                                       Controller#Action
#                            notifications GET    /notifications(.:format)                                                                          notifications#index
#                                          POST   /notifications(.:format)                                                                          notifications#create
#                         new_notification GET    /notifications/new(.:format)                                                                      notifications#new
#                        edit_notification GET    /notifications/:id/edit(.:format)                                                                 notifications#edit
#                             notification GET    /notifications/:id(.:format)                                                                      notifications#show
#                                          PATCH  /notifications/:id(.:format)                                                                      notifications#update
#                                          PUT    /notifications/:id(.:format)                                                                      notifications#update
#                                          DELETE /notifications/:id(.:format)                                                                      notifications#destroy
#                                          PUT    /notifications/:id/read(.:format)                                                                 notifications#read {"as"=>"notification_read"}
#                           team_todolists GET    /teams/:team_id/todolists(.:format)                                                               todolists#index
#                                          POST   /teams/:team_id/todolists(.:format)                                                               todolists#create
#                        new_team_todolist GET    /teams/:team_id/todolists/new(.:format)                                                           todolists#new
#                       edit_team_todolist GET    /teams/:team_id/todolists/:id/edit(.:format)                                                      todolists#edit
#                            team_todolist GET    /teams/:team_id/todolists/:id(.:format)                                                           todolists#show
#                                          PATCH  /teams/:team_id/todolists/:id(.:format)                                                           todolists#update
#                                          PUT    /teams/:team_id/todolists/:id(.:format)                                                           todolists#update
#                                          DELETE /teams/:team_id/todolists/:id(.:format)                                                           todolists#destroy
#                                    teams GET    /teams(.:format)                                                                                  teams#index
#                                          POST   /teams(.:format)                                                                                  teams#create
#                                 new_team GET    /teams/new(.:format)                                                                              teams#new
#                                edit_team GET    /teams/:id/edit(.:format)                                                                         teams#edit
#                                     team GET    /teams/:id(.:format)                                                                              teams#show
#                                          PATCH  /teams/:id(.:format)                                                                              teams#update
#                                          PUT    /teams/:id(.:format)                                                                              teams#update
#                                          DELETE /teams/:id(.:format)                                                                              teams#destroy
#                              memberships GET    /memberships(.:format)                                                                            memberships#index
#                                          POST   /memberships(.:format)                                                                            memberships#create
#                           new_membership GET    /memberships/new(.:format)                                                                        memberships#new
#                          edit_membership GET    /memberships/:id/edit(.:format)                                                                   memberships#edit
#                               membership GET    /memberships/:id(.:format)                                                                        memberships#show
#                                          PATCH  /memberships/:id(.:format)                                                                        memberships#update
#                                          PUT    /memberships/:id(.:format)                                                                        memberships#update
#                                          DELETE /memberships/:id(.:format)                                                                        memberships#destroy
#                                 features GET    /features(.:format)                                                                               features#index
#                                          POST   /features(.:format)                                                                               features#create
#                              new_feature GET    /features/new(.:format)                                                                           features#new
#                             edit_feature GET    /features/:id/edit(.:format)                                                                      features#edit
#                                  feature GET    /features/:id(.:format)                                                                           features#show
#                                          PATCH  /features/:id(.:format)                                                                           features#update
#                                          PUT    /features/:id(.:format)                                                                           features#update
#                                          DELETE /features/:id(.:format)                                                                           features#destroy
#                                  answers GET    /answers(.:format)                                                                                answers#index
#                                          POST   /answers(.:format)                                                                                answers#create
#                               new_answer GET    /answers/new(.:format)                                                                            answers#new
#                              edit_answer GET    /answers/:id/edit(.:format)                                                                       answers#edit
#                                   answer GET    /answers/:id(.:format)                                                                            answers#show
#                                          PATCH  /answers/:id(.:format)                                                                            answers#update
#                                          PUT    /answers/:id(.:format)                                                                            answers#update
#                                          DELETE /answers/:id(.:format)                                                                            answers#destroy
#                         question_answers GET    /questions/:question_id/answers(.:format)                                                         answers#index
#                                          POST   /questions/:question_id/answers(.:format)                                                         answers#create
#                      new_question_answer GET    /questions/:question_id/answers/new(.:format)                                                     answers#new
#                     edit_question_answer GET    /questions/:question_id/answers/:id/edit(.:format)                                                answers#edit
#                          question_answer GET    /questions/:question_id/answers/:id(.:format)                                                     answers#show
#                                          PATCH  /questions/:question_id/answers/:id(.:format)                                                     answers#update
#                                          PUT    /questions/:question_id/answers/:id(.:format)                                                     answers#update
#                                          DELETE /questions/:question_id/answers/:id(.:format)                                                     answers#destroy
#                                questions GET    /questions(.:format)                                                                              questions#index
#                                          POST   /questions(.:format)                                                                              questions#create
#                             new_question GET    /questions/new(.:format)                                                                          questions#new
#                            edit_question GET    /questions/:id/edit(.:format)                                                                     questions#edit
#                                 question GET    /questions/:id(.:format)                                                                          questions#show
#                                          PATCH  /questions/:id(.:format)                                                                          questions#update
#                                          PUT    /questions/:id(.:format)                                                                          questions#update
#                                          DELETE /questions/:id(.:format)                                                                          questions#destroy
#                                 comments GET    /comments(.:format)                                                                               comments#index
#                                          POST   /comments(.:format)                                                                               comments#create
#                              new_comment GET    /comments/new(.:format)                                                                           comments#new
#                             edit_comment GET    /comments/:id/edit(.:format)                                                                      comments#edit
#                                  comment GET    /comments/:id(.:format)                                                                           comments#show
#                                          PATCH  /comments/:id(.:format)                                                                           comments#update
#                                          PUT    /comments/:id(.:format)                                                                           comments#update
#                                          DELETE /comments/:id(.:format)                                                                           comments#destroy
#                            todo_comments GET    /todos/:todo_id/comments(.:format)                                                                comments#index
#                                          POST   /todos/:todo_id/comments(.:format)                                                                comments#create
#                         new_todo_comment GET    /todos/:todo_id/comments/new(.:format)                                                            comments#new
#                                          GET    /comments/:id/edit(.:format)                                                                      comments#edit
#                                          GET    /comments/:id(.:format)                                                                           comments#show
#                                          PATCH  /comments/:id(.:format)                                                                           comments#update
#                                          PUT    /comments/:id(.:format)                                                                           comments#update
#                                          DELETE /comments/:id(.:format)                                                                           comments#destroy
#                           todolist_todos GET    /todolists/:todolist_id/todos(.:format)                                                           todos#index
#                                          POST   /todolists/:todolist_id/todos(.:format)                                                           todos#create
#                        new_todolist_todo GET    /todolists/:todolist_id/todos/new(.:format)                                                       todos#new
#                                edit_todo GET    /todos/:id/edit(.:format)                                                                         todos#edit
#                                     todo GET    /todos/:id(.:format)                                                                              todos#show
#                                          PATCH  /todos/:id(.:format)                                                                              todos#update
#                                          PUT    /todos/:id(.:format)                                                                              todos#update
#                                          DELETE /todos/:id(.:format)                                                                              todos#destroy
#                        todolist_comments GET    /todolists/:todolist_id/comments(.:format)                                                        comments#index
#                                          POST   /todolists/:todolist_id/comments(.:format)                                                        comments#create
#                     new_todolist_comment GET    /todolists/:todolist_id/comments/new(.:format)                                                    comments#new
#                                          GET    /comments/:id/edit(.:format)                                                                      comments#edit
#                                          GET    /comments/:id(.:format)                                                                           comments#show
#                                          PATCH  /comments/:id(.:format)                                                                           comments#update
#                                          PUT    /comments/:id(.:format)                                                                           comments#update
#                                          DELETE /comments/:id(.:format)                                                                           comments#destroy
#                                todolists GET    /todolists(.:format)                                                                              todolists#index
#                                          POST   /todolists(.:format)                                                                              todolists#create
#                             new_todolist GET    /todolists/new(.:format)                                                                          todolists#new
#                            edit_todolist GET    /todolists/:id/edit(.:format)                                                                     todolists#edit
#                                 todolist GET    /todolists/:id(.:format)                                                                          todolists#show
#                                          PATCH  /todolists/:id(.:format)                                                                          todolists#update
#                                          PUT    /todolists/:id(.:format)                                                                          todolists#update
#                                          DELETE /todolists/:id(.:format)                                                                          todolists#destroy
#                            complete_todo PUT    /todo/:id/complete(.:format)                                                                      todos#complete
#                             todo_toolbar POST   /todo/:id/toolbar(.:format)                                                                       todos#toolbar
#                            subscriptions GET    /subscriptions(.:format)                                                                          subscriptions#index
#                                          POST   /subscriptions(.:format)                                                                          subscriptions#create
#                         new_subscription GET    /subscriptions/new(.:format)                                                                      subscriptions#new
#                        edit_subscription GET    /subscriptions/:id/edit(.:format)                                                                 subscriptions#edit
#                             subscription GET    /subscriptions/:id(.:format)                                                                      subscriptions#show
#                                          PATCH  /subscriptions/:id(.:format)                                                                      subscriptions#update
#                                          PUT    /subscriptions/:id(.:format)                                                                      subscriptions#update
#                                          DELETE /subscriptions/:id(.:format)                                                                      subscriptions#destroy
#                                    links GET    /links(.:format)                                                                                  links#index
#                                          POST   /links(.:format)                                                                                  links#create
#                                 new_link GET    /links/new(.:format)                                                                              links#new
#                                edit_link GET    /links/:id/edit(.:format)                                                                         links#edit
#                                     link GET    /links/:id(.:format)                                                                              links#show
#                                          PATCH  /links/:id(.:format)                                                                              links#update
#                                          PUT    /links/:id(.:format)                                                                              links#update
#                                          DELETE /links/:id(.:format)                                                                              links#destroy
#                                    short GET    /s/:slug(.:format)                                                                                links#show
#                                  landing GET    /landing/:book_id(.:format)                                                                       books#show
#                                    pages GET    /pages(.:format)                                                                                  pages#index
#                                          POST   /pages(.:format)                                                                                  pages#create
#                                 new_page GET    /pages/new(.:format)                                                                              pages#new
#                                edit_page GET    /pages/:id/edit(.:format)                                                                         pages#edit
#                                     page GET    /pages/:id(.:format)                                                                              pages#show
#                                          PATCH  /pages/:id(.:format)                                                                              pages#update
#                                          PUT    /pages/:id(.:format)                                                                              pages#update
#                                          DELETE /pages/:id(.:format)                                                                              pages#destroy
#                                   errors GET    /errors(.:format)                                                                                 errors#index
#                                          POST   /errors(.:format)                                                                                 errors#create
#                                new_error GET    /errors/new(.:format)                                                                             errors#new
#                               edit_error GET    /errors/:id/edit(.:format)                                                                        errors#edit
#                                    error GET    /errors/:id(.:format)                                                                             errors#show
#                                          PATCH  /errors/:id(.:format)                                                                             errors#update
#                                          PUT    /errors/:id(.:format)                                                                             errors#update
#                                          DELETE /errors/:id(.:format)                                                                             errors#destroy
#                             series_books POST   /series/:series_id/books(.:format)                                                                books#create
#                          new_series_book GET    /series/:series_id/books/new(.:format)                                                            books#new
#                         edit_series_book GET    /series/:series_id/books/:id/edit(.:format)                                                       books#edit
#                              series_book PATCH  /series/:series_id/books/:id(.:format)                                                            books#update
#                                          PUT    /series/:series_id/books/:id(.:format)                                                            books#update
#                             series_index GET    /series(.:format)                                                                                 series#index
#                                          POST   /series(.:format)                                                                                 series#create
#                               new_series GET    /series/new(.:format)                                                                             series#new
#                              edit_series GET    /series/:id/edit(.:format)                                                                        series#edit
#                                   series GET    /series/:id(.:format)                                                                             series#show
#                                          PATCH  /series/:id(.:format)                                                                             series#update
#                                          PUT    /series/:id(.:format)                                                                             series#update
#                                          DELETE /series/:id(.:format)                                                                             series#destroy
#                                  authors GET    /authors(.:format)                                                                                authors#index
#                                          POST   /authors(.:format)                                                                                authors#create
#                               new_author GET    /authors/new(.:format)                                                                            authors#new
#                              edit_author GET    /authors/:id/edit(.:format)                                                                       authors#edit
#                                   author GET    /authors/:id(.:format)                                                                            authors#show
#                                          PATCH  /authors/:id(.:format)                                                                            authors#update
#                                          PUT    /authors/:id(.:format)                                                                            authors#update
#                                          DELETE /authors/:id(.:format)                                                                            authors#destroy
#                  project_writing_entries GET    /projects/:project_id/writing_entries(.:format)                                                   writing_entries#index
#                                          POST   /projects/:project_id/writing_entries(.:format)                                                   writing_entries#create
#                new_project_writing_entry GET    /projects/:project_id/writing_entries/new/:date(.:format)                                         writing_entries#new
#               edit_project_writing_entry GET    /projects/:project_id/writing_entries/:id/edit(.:format)                                          writing_entries#edit
#                    project_writing_entry GET    /projects/:project_id/writing_entries/:id(.:format)                                               writing_entries#show
#                                          PATCH  /projects/:project_id/writing_entries/:id(.:format)                                               writing_entries#update
#                                          PUT    /projects/:project_id/writing_entries/:id(.:format)                                               writing_entries#update
#                                          DELETE /projects/:project_id/writing_entries/:id(.:format)                                               writing_entries#destroy
#                        project_todolists GET    /projects/:project_id/todolists(.:format)                                                         todolists#index
#                                          POST   /projects/:project_id/todolists(.:format)                                                         todolists#create
#                     new_project_todolist GET    /projects/:project_id/todolists/new(.:format)                                                     todolists#new
#                    edit_project_todolist GET    /projects/:project_id/todolists/:id/edit(.:format)                                                todolists#edit
#                         project_todolist GET    /projects/:project_id/todolists/:id(.:format)                                                     todolists#show
#                                          PATCH  /projects/:project_id/todolists/:id(.:format)                                                     todolists#update
#                                          PUT    /projects/:project_id/todolists/:id(.:format)                                                     todolists#update
#                                          DELETE /projects/:project_id/todolists/:id(.:format)                                                     todolists#destroy
#                                 projects GET    /projects(.:format)                                                                               projects#index
#                                          POST   /projects(.:format)                                                                               projects#create
#                              new_project GET    /projects/new(.:format)                                                                           projects#new
#                             edit_project GET    /projects/:id/edit(.:format)                                                                      projects#edit
#                                  project GET    /projects/:id(.:format)                                                                           projects#show
#                                          PATCH  /projects/:id(.:format)                                                                           projects#update
#                                          PUT    /projects/:id(.:format)                                                                           projects#update
#                                          DELETE /projects/:id(.:format)                                                                           projects#destroy
#                              books_admin GET    /books/admin(.:format)                                                                            books#admin
#                             book_praises GET    /books/:book_id/praises(.:format)                                                                 praises#index
#                                          POST   /books/:book_id/praises(.:format)                                                                 praises#create
#                          new_book_praise GET    /books/:book_id/praises/new(.:format)                                                             praises#new
#                         edit_book_praise GET    /books/:book_id/praises/:id/edit(.:format)                                                        praises#edit
#                              book_praise GET    /books/:book_id/praises/:id(.:format)                                                             praises#show
#                                          PATCH  /books/:book_id/praises/:id(.:format)                                                             praises#update
#                                          PUT    /books/:book_id/praises/:id(.:format)                                                             praises#update
#                                          DELETE /books/:book_id/praises/:id(.:format)                                                             praises#destroy
#                          book_book_links GET    /books/:book_id/book_links(.:format)                                                              book_links#index
#                                          POST   /books/:book_id/book_links(.:format)                                                              book_links#create
#                       new_book_book_link GET    /books/:book_id/book_links/new(.:format)                                                          book_links#new
#                      edit_book_book_link GET    /books/:book_id/book_links/:id/edit(.:format)                                                     book_links#edit
#                           book_book_link GET    /books/:book_id/book_links/:id(.:format)                                                          book_links#show
#                                          PATCH  /books/:book_id/book_links/:id(.:format)                                                          book_links#update
#                                          PUT    /books/:book_id/book_links/:id(.:format)                                                          book_links#update
#                                          DELETE /books/:book_id/book_links/:id(.:format)                                                          book_links#destroy
#                                move_book PATCH  /books/:id/move(.:format)                                                                         books#move
#                                    books GET    /books(.:format)                                                                                  books#index
#                                          POST   /books(.:format)                                                                                  books#create
#                                 new_book GET    /books/new(.:format)                                                                              books#new
#                                edit_book GET    /books/:id/edit(.:format)                                                                         books#edit
#                                     book GET    /books/:id(.:format)                                                                              books#show
#                                          PATCH  /books/:id(.:format)                                                                              books#update
#                                          PUT    /books/:id(.:format)                                                                              books#update
#                                          DELETE /books/:id(.:format)                                                                              books#destroy
#                                  praises GET    /praises(.:format)                                                                                praises#index
#                                          POST   /praises(.:format)                                                                                praises#create
#                               new_praise GET    /praises/new(.:format)                                                                            praises#new
#                              edit_praise GET    /praises/:id/edit(.:format)                                                                       praises#edit
#                                   praise GET    /praises/:id(.:format)                                                                            praises#show
#                                          PATCH  /praises/:id(.:format)                                                                            praises#update
#                                          PUT    /praises/:id(.:format)                                                                            praises#update
#                                          DELETE /praises/:id(.:format)                                                                            praises#destroy
#                              posts_admin GET    /posts/admin(.:format)                                                                            posts#admin
#                                    posts GET    /posts(.:format)                                                                                  posts#index
#                                          POST   /posts(.:format)                                                                                  posts#create
#                                 new_post GET    /posts/new(.:format)                                                                              posts#new
#                                edit_post GET    /posts/:id/edit(.:format)                                                                         posts#edit
#                                     post GET    /posts/:id(.:format)                                                                              posts#show
#                                          PATCH  /posts/:id(.:format)                                                                              posts#update
#                                          PUT    /posts/:id(.:format)                                                                              posts#update
#                                          DELETE /posts/:id(.:format)                                                                              posts#destroy
#                         new_user_session GET    /users/sign_in(.:format)                                                                          devise/passwordless/sessions#new
#                             user_session POST   /users/sign_in(.:format)                                                                          devise/passwordless/sessions#create
#                     destroy_user_session DELETE /users/sign_out(.:format)                                                                         devise/passwordless/sessions#destroy
#                        new_user_password GET    /users/password/new(.:format)                                                                     devise/passwords#new
#                       edit_user_password GET    /users/password/edit(.:format)                                                                    devise/passwords#edit
#                            user_password PATCH  /users/password(.:format)                                                                         devise/passwords#update
#                                          PUT    /users/password(.:format)                                                                         devise/passwords#update
#                                          POST   /users/password(.:format)                                                                         devise/passwords#create
#                 cancel_user_registration GET    /users/cancel(.:format)                                                                           users/registrations#cancel
#                    new_user_registration GET    /users/sign_up(.:format)                                                                          users/registrations#new
#                   edit_user_registration GET    /users/edit(.:format)                                                                             users/registrations#edit
#                        user_registration PATCH  /users(.:format)                                                                                  users/registrations#update
#                                          PUT    /users(.:format)                                                                                  users/registrations#update
#                                          DELETE /users(.:format)                                                                                  users/registrations#destroy
#                                          POST   /users(.:format)                                                                                  users/registrations#create
#                    new_user_confirmation GET    /users/confirmation/new(.:format)                                                                 users/confirmations#new
#                        user_confirmation GET    /users/confirmation(.:format)                                                                     users/confirmations#show
#                                          POST   /users/confirmation(.:format)                                                                     users/confirmations#create
#                          new_user_unlock GET    /users/unlock/new(.:format)                                                                       devise/unlocks#new
#                              user_unlock GET    /users/unlock(.:format)                                                                           devise/unlocks#show
#                                          POST   /users/unlock(.:format)                                                                           devise/unlocks#create
#                         users_magic_link GET    /users/magic_link(.:format)                                                                       devise/passwordless/magic_links#show
#                              unsubscribe GET    /users/unsubscribe/:unsubscribe_hash/:subscription(.:format)                                      emails#unsubscribe
#                                users_all GET    /users/all(.:format)                                                                              users#all
#                               users_show GET    /users/show(.:format)                                                                             users#show
#                                 users_me GET    /users/me(.:format)                                                                               users#me
#                             book_release GET    /book/:id/release(.:format)                                                                       books#release
#                                          GET    /posts/:id/publish(.:format)                                                                      posts#publish
#                          posts_broadcast GET    /posts/:id/broadcast(.:format)                                                                    posts#broadcast
#                             static_index GET    /static/index(.:format)                                                                           static#index
#                                dashboard GET    /dashboard(.:format)                                                                              dashboard#index
#                                     atom GET    /atom.xml(.:format)                                                                               xml#atom
#                                  sitemap GET    /sitemap.xml(.:format)                                                                            xml#sitemap
#                              subscribers GET    /dashboard/subscribers(.:format)                                                                  subscriptions#subscribers
#                                    about GET    /about(.:format)                                                                                  static#about
#                                 diceware GET    /diceware(.:format)                                                                               static#diceware
#                                fullclock GET    /fullclock(.:format)                                                                              static#fullclock
#                                  privacy GET    /privacy(.:format)                                                                                static#privacy
#                                    terms GET    /terms(.:format)                                                                                  static#terms
#                                     root GET    /                                                                                                 landing#index
#                                not_found GET    /404(.:format)                                                                                    errors#not_found
#                                          GET    /422(.:format)                                                                                    errors#unacceptable
#                                          GET    /500(.:format)                                                                                    errors#internal_error
#                                          GET    /robots.txt(.:format)                                                                             static#robots
#                                          GET    /:slug(.:format)                                                                                  errors#not_found
#         turbo_recede_historical_location GET    /recede_historical_location(.:format)                                                             turbo/native/navigation#recede
#         turbo_resume_historical_location GET    /resume_historical_location(.:format)                                                             turbo/native/navigation#resume
#        turbo_refresh_historical_location GET    /refresh_historical_location(.:format)                                                            turbo/native/navigation#refresh
#            rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                           action_mailbox/ingresses/postmark/inbound_emails#create
#               rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                              action_mailbox/ingresses/relay/inbound_emails#create
#            rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                           action_mailbox/ingresses/sendgrid/inbound_emails#create
#      rails_mandrill_inbound_health_check GET    /rails/action_mailbox/mandrill/inbound_emails(.:format)                                           action_mailbox/ingresses/mandrill/inbound_emails#health_check
#            rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                           action_mailbox/ingresses/mandrill/inbound_emails#create
#             rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                                       action_mailbox/ingresses/mailgun/inbound_emails#create
#           rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                          rails/conductor/action_mailbox/inbound_emails#index
#                                          POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                          rails/conductor/action_mailbox/inbound_emails#create
#        new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                                      rails/conductor/action_mailbox/inbound_emails#new
#       edit_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                                 rails/conductor/action_mailbox/inbound_emails#edit
#            rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#show
#                                          PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#update
#                                          PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#update
#                                          DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#destroy
# new_rails_conductor_inbound_email_source GET    /rails/conductor/action_mailbox/inbound_emails/sources/new(.:format)                              rails/conductor/action_mailbox/inbound_emails/sources#new
#    rails_conductor_inbound_email_sources POST   /rails/conductor/action_mailbox/inbound_emails/sources(.:format)                                  rails/conductor/action_mailbox/inbound_emails/sources#create
#    rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                               rails/conductor/action_mailbox/reroutes#create
# rails_conductor_inbound_email_incinerate POST   /rails/conductor/action_mailbox/:inbound_email_id/incinerate(.:format)                            rails/conductor/action_mailbox/incinerates#create
#                       rails_service_blob GET    /rails/active_storage/blobs/redirect/:signed_id/*filename(.:format)                               active_storage/blobs/redirect#show
#                 rails_service_blob_proxy GET    /rails/active_storage/blobs/proxy/:signed_id/*filename(.:format)                                  active_storage/blobs/proxy#show
#                                          GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                                        active_storage/blobs/redirect#show
#                rails_blob_representation GET    /rails/active_storage/representations/redirect/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations/redirect#show
#          rails_blob_representation_proxy GET    /rails/active_storage/representations/proxy/:signed_blob_id/:variation_key/*filename(.:format)    active_storage/representations/proxy#show
#                                          GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format)          active_storage/representations/redirect#show
#                       rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                                       active_storage/disk#show
#                update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                               active_storage/disk#update
#                     rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                                    active_storage/direct_uploads#create

Rails.application.routes.draw do
  resources :notifications
  put 'notifications/:id/read' => 'notifications#read', format: :turbo_stream, 'as' => 'notification_read'

  resources :teams do
    resources :todolists
  end
  resources :memberships
  resources :features
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :answers
  resources :questions do
    resources :answers
  end
  resources :comments

  resources :todolists, shallow: true do
    resources :todos do
      resources :comments#, shallow: true
    end
    resources :comments
  end
  # resources :comments

  put 'todo/:id/complete' => 'todos#complete', format: :turbo_stream, as: 'complete_todo'
  post 'todo/:id/toolbar' => 'todos#toolbar', format: :turbo_stream, as: 'todo_toolbar'


  resources :subscriptions

  resources :links
  get '/s/:slug', to: 'links#show', as: :short
  get '/landing/:book_id', to: 'books#show', as: 'landing'

  resources :pages
  resources :errors

  # mount Blazer::Engine, at: "blazer"

  resources :series do
    resources :books, only: %i[new create edit update]
  end
  resources :authors
  resources :projects do
    resources :writing_entries, path_names: { new: 'new/:date' }
    resources :todolists
  end
  get 'books/admin' => 'books#admin'
  resources :books do
    resources :praises
    resources :book_links
    member do
      patch :move
    end
  end
  resources :praises

  get 'posts/admin' => 'posts#admin'
  resources :posts
  devise_for :users, controllers: {
    sessions: 'devise/passwordless/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }
  devise_scope :user do
    get '/users/magic_link',
        to: 'devise/passwordless/magic_links#show',
        as: 'users_magic_link'

  end
  # notify_to :users
  get 'users/unsubscribe/:unsubscribe_hash/:subscription' => 'emails#unsubscribe', as: 'unsubscribe'

  get 'users/all'
  get 'users/show'
  get 'users/me'
  get 'book/:id/release' => 'books#release', as: 'book_release'
  get 'posts/:id/publish' => 'posts#publish'
  get 'posts/:id/broadcast' => 'posts#broadcast', as: 'posts_broadcast'
  get 'static/index'

  get 'dashboard' => 'dashboard#index'
  get 'atom.xml' => 'xml#atom', format: :xml, as: :atom
  get 'sitemap.xml' => 'xml#sitemap', format: :xml, as: :sitemap
  get 'dashboard/subscribers' => 'subscriptions#subscribers', as: 'subscribers'
  get '/about' => 'static#about'
  get '/diceware' => 'static#diceware'
  get '/fullclock' => 'static#fullclock'
  get '/privacy' => 'static#privacy'
  get '/terms' => 'static#terms'

  root to: 'landing#index'
  get '404', to: 'errors#not_found', as: 'not_found'
  get '422', to: 'errors#unacceptable'
  get '500', to: 'errors#internal_error'
  get '/robots.txt' => 'static#robots'
  get '/:slug', via: :all, to: 'errors#not_found'
end
