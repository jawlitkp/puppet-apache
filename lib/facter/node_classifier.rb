require 'socket'
require 'yaml'
require File.join(File.dirname(__FILE__), 'func')
#require File.join(File.dirname(__FILE__), 'node_definitions')

Facter.add(:classification_hash) do
    setcode do
        classification_hash = {}
        subnets = {
					  "google_east_corp" => {
											    "low"       => "10.161.56.0",
												"high"      => "10.161.56.255",
											    "provider"  => "datapipe",
												"region"    => "east",
												"env"       => "prod",
										    }
	                    }

            ip = IPSocket.getaddress(Socket.gethostname)
            fqdn = Socket.gethostname
            hostname = fqdn.split(/[.\s]/)[0]
            provider = nil
            region = nil
            env = nil

            @subnets.each do |key, value|
                    if ip_addr_in_range?(value["low"], value["high"], ip)
                        classification_hash["provider"] = value["provider"]
                        classification_hash["region"] = value["region"]
                        classification_hash["env"] = value["env"]

                end
            end

        classification_hash
    end 
end 

