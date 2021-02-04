RailsAdmin.config do |config|
  config.main_app_name = ["Look app", "Look"]

  config.authenticate_with do
    authenticate_or_request_with_http_basic("Login required") do |email, password|
      user = User.where(email: email).first
      user.authenticate(password) if user
    end
  end

  # config.model "Course" do
  #   list do
  #     field :lessons do
  #       searchable [{ Lesson => :created_at }]
  #     end

  #     field :name do
  #       searchable [{ Lesson => :created_at }]
  #     end

  #     scopes [:with_lessons]
  #   end
  # end

  config.actions do
    # root actions
    dashboard                     # mandatory
    # collection actions
    index                         # mandatory
    new
    export
    history_index
    bulk_delete
    # member actions
    show
    edit
    delete
    history_show
    show_in_app
  end

  ActiveRecord::Base.descendants.each do |imodel|
    config.model "#{imodel.name}" do
      list do
        exclude_fields :created_at, :updated_at
      end
    end
  end
end
