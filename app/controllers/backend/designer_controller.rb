class Backend::DesignerController < ApplicationController

  def index

  end

  def become_designer

    @Role = Role.find_by_name('designer')
    current_user.roles.concat(@Role) unless current_user.is_designer
    current_user.save

    redirect_to backend_designer_index_path
  end

end
