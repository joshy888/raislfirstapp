class Jobresult < ActiveRecord::Base
   # attr_accessible :title, :body

 def jobsearch(options={})
   result = self.class.get("http://api.careerbuilder.com/v1/jobsearch?", :query => {:DeveloperKey => "WDHQ4VK5ZGXFY0PDH094",:outputjson => true})
   # puts "s"
    return result
  end
end
