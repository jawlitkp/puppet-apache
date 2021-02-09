#!/opt/puppetlabs/puppet/bin/ruby


@subnets =  subnets = {
					  "datapipe_east_prod" => {
											    "low"       => "10.161.56.0",
												"high"      => "10.161.56.255",
											    "provider"  => "datapipe",
												"region"    => "east",
												"env"       => "prod",
										    }
	                    }

