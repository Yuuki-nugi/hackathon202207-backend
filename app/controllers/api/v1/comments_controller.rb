class Api::V1::CommentsController < ApplicationController
    before_action :authenticate_api_v1_user!

    def index
        number = params[:number]
        start = params[:start]
        work_id = params[:work_id]
        work = Work.find(work_id)
        if start
            if comments = work.comments.where("comments.id <= ?", start).order('id desc').limit(number)
                render json: { status: 200, comments: comments}
            else
                render json: { status: 422, message: "fail"}
            end
        else
            if comments = work.comments.order('id desc').limit(number)
                render json: { status: 200, comments: comments}
            else
                render json: { status: 422, message: "fail"}
            end
        end
    end

    def create
        work_id = params[:work_id]
        text = params[:text]
        if text
            if comment = current_api_v1_user.comments.create(work_id: work_id, text: text)
                render json: { status: 200, comment: comment}
            else
                render json: { status: 422, message: "fail"}
            end
        end
    end
end
