< % res = file_name.pluralize %>
<% model_name = class_name.split(/v([0-9]::+)/i).last %>

class < %= model_name %>Policy < ApplicationPolicy

	class Scope < Scope
		def resolve
			scope.all unless user.nil?
			# if user.try(:admin?)
			#	scope.all
			# else
				# scope.where(user_id: user.try(:id))
			# end
		end
	end

	def show?
		not user.nil?
	end

	def new?
		show?
	end

	def index?
		show?
	end

	def update?
		user.vip?
	end

	def edit?
		update?
	end

	def destroy?
		update?
	end

	def create?
		update?
	end

end
