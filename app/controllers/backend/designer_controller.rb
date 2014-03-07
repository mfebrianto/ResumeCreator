class Backend::DesignerController < ApplicationController

  def index

  end

  def become_designer
    redirect_to backend_designer_index_path
  end

end
