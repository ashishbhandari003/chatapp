class Message < ApplicationRecord

	validates :content, presence: true

	belongs_to :user

	after_create_commit :append_message

	def append_message
		MessageJob.perform_now(self)
	end

end
