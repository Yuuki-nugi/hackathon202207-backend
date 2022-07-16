class Api::V1::WorksController < ApplicationController
    before_action :authenticate_api_v1_user!

    def index
        works = current_api_v1_user.works
        render json: { status: 200, works: works }
    end

    def show
        work_id = params[:id]
        work = Work.find(work_id)
        themes = work.themes.all
        sum_feeling = work.feelings.where(created_at: Time.zone.now - 5.second..Time.zone.now).all.sum(:degree)
        feeling = work.feelings.find_by(user_id: current_api_v1_user.id)
        if !feeling
            feeling =  current_api_v1_user.feelings.create(work_id: work_id)
        end
        last_theme_id = work.progresses.last&.theme_id || nil
        number_of_participants = work.participants.length
        render json: { status: 200, work: work, themes: themes, sum_feeling: sum_feeling, feeling: feeling.degree, last_theme_id: last_theme_id, number_of_participants: number_of_participants}
    end

    def create
        name = "新しいワーク"
        if current_api_v1_user.works.create(work_name: name)
            render json: { status: 200, works: current_api_v1_user.works}
        else
            render json: { status: 422, message: "fail"}
        end
    end

    def update
        name = params[:name]
        name ||= "新しいワーク"
        id = params[:id]
        work = current_api_v1_user.works.find(id)
        if work
            if work.update(work_name: name)
                render json: { status: 200, work: current_api_v1_user.works}
            else
                render json: { status: 422, message: "fail"}
            end
        end
    end

    def destroy
        work_id = params[:id]
        if current_api_v1_user.works.find(work_id).delete
            render json: { status: 200, works: current_api_v1_user.works}
        else
            render json: { status: 422, message: "fail"}
        end
    end
end
