class Api::V1::ThemesController < ApplicationController
    def index
    end

    def create
        work = Work.find(params[:work_id])
        title = params[:title]
        title ||= "新しいテーマ"
        if theme = work.themes.create(title: title)
            render json: { status: 200, theme: theme }
        else
            render json: { status: 422, message: 'fail' }
        end
    end

    def update
        theme = Theme.find(params[:id])
        if theme.update(theme_params)
            render json: { status: 200, theme: theme }
        else
            render json: { status: 422, message: 'fail' }
        end
    end

    def destroy
        theme = Theme.find(params[:id])
        if theme.destroy
            render json: { status: 200, theme: 'success' }
        else
            render json: { status: 422, message: 'fail' }
        end
    end

    private
    def theme_params
        params.require(:theme).permit(:title, :result)
    end
end
