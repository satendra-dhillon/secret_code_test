class SecretCodesController < ApplicationController
	

	def index
		@secret_codes = SecretCode.all
	end

	def genrate_secret_code
		(1..params[:range].to_i).each do |i|
			no = Digest::SHA1.hexdigest([Time.now, rand].join)[0..5]
			SecretCode.create(code: no)
		end
		redirect_to secret_codes_path

	end
end
