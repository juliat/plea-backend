class BehaviorInstancesController < ApplicationController
	def destroy
      @behavior_instance = BehaviorInstance.find(params[:id])
      @behavior_instance.destroy
      # lfash[:notice] = "Successfully removed assignment for #{@assignment.employee.proper_name} to the #{@assignment.store.name} store from the system."
      # redirect_to somewhere_url
    end

    def show
    	@behavior_instance = BehaviorInstance.find(params[:id])

		respond_to do |format|
      		format.json { render json: @behavior_instance.instance_eval{|behavior_instance| {:id => behavior_instance.id, 
      																			   :behavior_id => behavior_instance.behavior_id, 
      																			   :date => behavior_instance.date,
      																			   :time => behavior_instance.time,
      																			   :student_id => behavior_instance.student_id,
      																			}
      														  }}
      	end
    end
end