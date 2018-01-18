class User < ActiveRecord::Base
	has_secure_password
	# gives 3 new methods
	# password
	# setting the password
end