class CatsController < ApplicationController

    def index
        @cats = Cat.all 
        render :index
    end

    def show
        @c = Cat.find_by(id: params[:id])
        render :show
    end

    def new
        @c = Cat.new
        render :new
    end

    def create
        @c = Cat.new(cat_params)
        if @c.save
            redirect_to cat_url(@c)
        else
            render :new
        end
    end

    def edit
        @c = Cat.find_by(id: params[:id])
        render :edit
    end

    def update
        @c = Cat.find_by(id: params[:id])
        if @c.update(cat_params)
            redirect_to cat_url(@c)
        else  
            render :edit 
        end
    end

    private

    def cat_params
        params.require(:cat).permit(:name,:birth_date,:sex,:color,:description)
    end
end