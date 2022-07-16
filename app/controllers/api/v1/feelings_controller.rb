class Api::V1::FeelingsController < ApplicationController
    before_action :authenticate_api_v1_user!

    def update
        work_id = params[:work_id]
        is_plus = params[:is_plus]
        work = Work.find(work_id)
        feeling = work.feelings.find_by(user_id: current_api_v1_user.id)
        if feeling
            if is_plus == true
                feeling.update(degree: feeling.degree + 1)
            else
                feeling.update(degree: feeling.degree - 1)
            end
        else
            feeling =  current_api_v1_user.feelings.create(work_id: work_id)
        end
        sum_feeling = work.feelings.sum(:degree)
        render json: { status: 200, sum_feeling: sum_feeling, feeling: feeling.degree }
    end
end
# .where(created_at: Time.zone.now - 5.second..Time.zone.now)