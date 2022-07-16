class Api::V1::ProgressesController < ApplicationController
    def create
        work = Work.find(params[:work_id])
        is_play_or_pause = !params[:theme_id].nil?
        if progress = work.progresses.create(theme_id: params[:theme_id])
            render json: { status: 200, is_play_or_pause: is_play_or_pause}
        else
            render json: { status: 422, message: 'fail' }
        end

    end
end
