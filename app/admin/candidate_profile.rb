ActiveAdmin.register CandidateProfile do
  permit_params :lastname, :firstname, :patronymic, :birthday, :description, :vacancy_id, :email, :phone, :resume
                # emails_attributes: %i[id email description actual_state _destroy],
                # phones_attributes: %i[id phone description actual_state _destroy]

  filter :vacancy
  filter :lastname
  filter :firstname
  filter :patronymic
  filter :birthday
  filter :email
  filter :phone
  filter :created_at


  index do
    id_column
    column :vacancy
    column :lastname
    column :firstname
    column :patronymic
    column :birthday
    column :email
    column :phone
    column :created_at
    column :updated_at
    actions
  end

  form title: CandidateProfile.model_name.human do |f|
    f.semantic_errors *f.object.errors
    inputs do
      f.input :vacancy
      f.input :lastname
      f.input :firstname
      f.input :patronymic
      f.input :birthday, start_year: Time.new.year - 100, end_year: Time.new.year - 10
      f.input :email, as: :email
      f.input :phone
      f.file_field :resume
      f.input :description
    end


    # f.inputs do
    #   f.has_many :emails, allow_destroy: true do |email_form|
    #     email_form.input :email
    #     email_form.input :description, as: :text
    #     email_form.input :actual_state
    #   end
    # end
    #
    # f.inputs do
    #   f.has_many :phones, allow_destroy: true do |email_form|
    #     email_form.input :phone
    #     email_form.input :description, as: :text
    #     email_form.input :actual_state
    #   end
    # end

    f.actions
  end


  show do
    panel CandidateProfile.model_name.human do
      attributes_table_for candidate_profile do
        row :vacancy
        row :lastname
        row :firstname
        row :patronymic
        row :birthday
        row :email
        row :phone
        row :resume do |candidate_profile|
          resume_download_safe_link(candidate_profile)
        end
        row :description
        row :created_at
        row :updated_at
      end
    end

    # panel Email.model_name.human do
    #   table_for resource.emails do
    #     column :email
    #     column :description
    #     column :actual_state
    #     column :created_at
    #     column :updated_at
    #     # column '' do |building_part|
    #     #   link_to I18n.t('my_active_admin.building.show'), admin_building_part_path(id: building_part.id)
    #     # end
    #   end
    # end
    #
    # panel Phone.model_name.human do
    #   table_for resource.phones do
    #     column :phone
    #     column :description
    #     column :actual_state
    #     column :created_at
    #     column :updated_at
    #     # column '' do |building_part|
    #     #   link_to I18n.t('my_active_admin.building.show'), admin_building_part_path(id: building_part.id)
    #     # end
    #   end
    # end

    active_admin_comments
  end
end
