class Api::V1::ParticipantsController < ApplicationController

    def create
        email = params[:email]
        work_id = params[:work_id]
        work = Work.find(work_id)
        user = User.find_by(email: email)
        if user
            if work.participants.find_by(user: user)
                render json: { status: 422, message: "招待済みのuserです"}
            else
                if work.participants.create(user: user)
                    render json: { status: 200, number_of_participants: work.participants.length}
                else
                    render json: { status: 422, message: "fail"}
                end
            end
        else
            render json: { status: 422, message: "userが存在しません"}
        end
    end
end
