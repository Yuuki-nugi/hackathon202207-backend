class Api::V1::ProgressesController < ApplicationController
    before_action :authenticate_api_v1_user!
    def create
        work = Work.find(params[:work_id])
        if progress = work.progresses.create(theme_id: params[:theme_id])
            render json: { status: 200, progressing_id: progress.theme_id}
        else
            render json: { status: 422, message: 'fail' }
        end

    end
end
