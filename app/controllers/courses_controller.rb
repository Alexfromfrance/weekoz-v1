class CoursesController < ApplicationController
  def create
    @trainer = User.find(params[:user_id])
    @course = Course.new(course_params)
    @course.trainer = @trainer
    @course.save
  end

  private

  def course_params
    params.require(:course).permit(:title, :course_type, :address, :start, :end, :min_participants, :max_participants, :price, :prepayment)
  end
end
