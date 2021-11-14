
module FDP
  module Builder
    class Connection
      CONTEXT="https://raw.githubusercontent.com/SEMICeu/DCAT-AP/master/releases/2.0.0/dcat-ap_2.0.0.jsonld"
      AP = "https://github.com/SEMICeu/DCAT-AP/blob/master/releases/2.0.0/dcat-ap_2.0.0.rdf"

      def initialize baseuri:, fdpuri:, user:, pass:
        set_token baseuri: baseuri, user: user, pass: pass
      
      end

      def set_token baseuri:, user:, pass:

        payload = { "email": user, "password":  pass }.to_json
        resp = RestClient.post(baseuri + "/tokens", payload, headers={content_type: 'application/json'})
            
        token = JSON.parse(resp.body)["token"]


        $stderr.puts token
        $jsonheaders= {content_type: 'application/json', authorization: "Bearer #{token}", accept: "application/json"}
        $ttlheaders=  {content_type: 'text/turtle', authorization: "Bearer #{token}", accept: "text/turtle"}
      end
    end


  end
end
