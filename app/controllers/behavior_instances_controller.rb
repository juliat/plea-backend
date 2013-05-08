class BehaviorInstancesController < ApplicationController
	def destroy
      @behavior_instance = BehaviorInstance.find(params[:id])
      @behavior_instance.destroy
      f# lash[:notice] = "Successfully removed assignment for #{@assignment.employee.proper_name} to the #{@assignment.store.name} store from the system."
      # redirect_to somewhere_url
    end
end