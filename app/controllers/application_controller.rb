class ApplicationController < ActionController::Base
	include HTTParty
	base_uri "http://api.careerbuilder.com"

# intailizing the host site
def intailize(hostsite="US")
@hostsite=hostsite
end

#Defining the developer key
def default_developerKey
 	{:DeveloperKey=>"WDHQ4VK5ZGXFY0PDH094"}
end 

 #defining hoststite
 def default_hostsite
  	{:Hostsite=>@hostsite}
 end

 def mashup(response)
    puts response.inspect
    case response.code
      when 200
        if response.is_a?(Hash)
          Hashie::Mash.new(response)
        else
          if response.first.is_a?(Hash)
            response.map{|item| Hashie::Mash.new(item)}
          else
            response
          end
        end
    end
  end


def LoadJobs(options={})
		#API Access
	mashup(self.class.get("/v1/jobsearch?", :query => options.merge(self.default_developerKey).merge(self.default_hostsite)))
end
  

end
