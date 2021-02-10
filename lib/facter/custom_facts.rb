require 'socket'

def ip_addr_in_range?(low, high, addr)
    int_addr = numeric_ip(addr)
    int_addr <= numeric_ip(high) && int_addr >= numeric_ip(low)
end
  
def numeric_ip(ip_str)
    ip_str.split('.').inject(0) { |ip_num, part| ( ip_num << 8 ) + part.to_i }
end

def subnets = {
        "google_east_corp" => {
                                "low"       => "10.234.0.0",
                                "high"      => "10.234.255.255",
                                "provider"  => "google",
                                "region"    => "east",
                                "env"       => "corp",
                            }
        }

Facter.add(:custom_facts) do    
    setcode do
        def custom_facts = {}
            ip = IPSocket.getaddress(Socket.gethostname)
            fqdn = Socket.gethostname
            hostname = fqdn.split(/[.\s]/)[0]            
            custom_facts["ip"] = ip
            subnets.each do |key, value|
                    if ip_addr_in_range?(value["low"], value["high"], ip)
                        custom_facts["provider"] = value["provider"]
                        custom_facts["region"] = value["region"]
                        custom_facts["env"] = value["env"]
                end
            end
        custom_facts
    end 
end 

