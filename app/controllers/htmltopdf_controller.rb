class HtmltopdfController < ApplicationController
  
  def sample_resume
    respond_to do |format|
      format.pdf do
        render :pdf => "sample_resume.pdf",
               :template => "htmltopdf/sample_resume.html.erb"
      end
      
      format.html
    end
  end
  
end
