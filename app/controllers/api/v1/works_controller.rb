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
        sum_degree = work.feelings.where(created_at: Time.zone.now - 5.second..Time.zone.now).all.sum(:degree)
        last_theme_id = work.progresses.last&.theme_id || nil
        render json: { status: 200, work: work, themes: themes, sum_degree: sum_degree, last_theme_id: last_theme_id }
    end

    def new

    end

    def create
        name = params[:name]
        if current_api_v1_user.works.create(work_name: name)
            render json: { status: 200, message: "success"}
        else
            render json: { status: 422, message: "fail"}
        end
    end

    def edit

    end

    def update
    end

    def destroy
        work_id = params[:work_id]
        if current_api_v1_user.works.find(work_id).delete
            render json: { status: 200, message: "success"}
        else
            render json: { status: 422, message: "fail"}
        end
    end
end
