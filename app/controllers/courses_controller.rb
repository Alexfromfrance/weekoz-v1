class CoursesController < ApplicationController
  def create
    @trainer = User.find(params[:user_id])
    @course = Course.new(course_params)
    @course.trainer = @trainer
    @course.save
  end

  def create_api
    @trainer = User.find(params[:id])
    @courses = @trainer.courses
    render json: @courses
  end

  def update_time
    @course = Course.find(params[:id])
    @course.start = params[:start].split('(')[0].gsub(' GMT ','+')
    @course.end = params[:end].split('(')[0].gsub(' GMT ','+')
    @course.save
  end

  private

  def course_params
    params.require(:course).permit(:title, :course_type, :address, :start, :end, :min_participants, :max_participants, :price, :prepayment)
  end
end
