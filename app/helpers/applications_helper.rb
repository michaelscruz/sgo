module ApplicationsHelper
  def link_to_add_applicant(name, f)
    new_object = f.object.applicants.new
    id = new_object.object_id
    fields = f.fields_for(:applicants, new_object, child_index: id) do |builder|
      render('applicant', :f => builder)
    end

    link_to(name, '#', :class => "btn btn-secondary add-fields", :data => {:id => id, :fields => fields.gsub("\n", "")})
  end

  def link_to_add_file(name, f)
    new_object = f.object.application_files.new
    id = new_object.object_id
    fields = f.fields_for(:application_files, new_object, child_index: id) do |builder|
      render('application_file', :f => builder)
    end

    link_to(name, '#', :class => "btn btn-secondary add-fields", :data => {:id => id, :fields => fields.gsub("\n", "")})
  end
end
