class JobresultsController < ApplicationController

def index
     if !params[:keywrd].blank? &&!params[:loc].blank?
        @jobresults= LoadJobs(:Keyword=>params[:keywrd],:location=>params[:loc])
      elsif !params[:keywrd].blank? && params[:loc].blank?
        @jobresults= LoadJobs(:Keyword=>params[:keywrd])
      elsif params[:keywrd].blank? && !params[:loc].blank?
        @jobresults=LoadJobs(:location=>params[:loc])
      else
          @jobresults=LoadJobs(:Keyword=>"")      
       end
  end

end
