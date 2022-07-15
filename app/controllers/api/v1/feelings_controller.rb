class Api::V1::FeelingsController < ApplicationController
    before_action :authenticate_api_v1_user!

    def update
        work_id = params[:work_id]
        degree = params[:degree]
        work = current_api_v1_user.works.find(work_id)
        feeling = work.feelings.find_by(user_id: current_api_v1_user.id)   
        if feeling
           feeling.degree = degree
        else
            work.feelings.create(user_id: current_api_v1_user.id, degree: degree)
        end

        sum_degree = work.feelings.where(created_at: Time.zone.now - 5.second..Time.zone.now).all.sum(:degree)
        render json: { status: 200, sum_degree: sum_degree }
    end
end
