class TargetsController < ApplicationController
  before_action :target_params, only: %i[create update]
  before_action :set_course, only: %i[index new create edit update destroy close]
  before_action :set_target, only: %i[show edit update destroy close]
  before_action :set_active_courses

  def index
    all_targets = policy_scope(Target).sort_by(&:name).select { |target| target.course.id == @course.id }

    if current_user.role == "tutor"
      @targets = all_targets.select { |target| target.course.tutor_user_id == current_user.id }
    else
      @targets = all_targets.select { |target| target.course.student_user_id == current_user.id }
    end
  end

  def show
    authorize @target
  end

  def new
    @target = Target.new
    @target.course = @course
    authorize @target

    set_target_options
  end

  def create
    @target = Target.new(target_params)
    @target.course = @course
    authorize @target

    if @target.save
      redirect_to course_assignments_path(@course)
    else
      render :new
    end
  end

  def edit
    @target.course = @course
    authorize @target

    set_target_options
  end

  def update
    @target.course = @course
    authorize @target

    if @target.update(target_params)
      redirect_to course_assignments_path(@course)
    else
      render :edit
    end
  end

  def destroy
    authorize @target
    @target.destroy

    redirect_to course_assignments_path(@course)
  end

  private

  def target_params
    params.require(:target).permit(:name, :description, :score, :display, :course_id, :parent_id)
  end

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_target
    @target = Target.find(params[:id])
  end

  def set_active_courses
    @active_courses = "class=active"
  end

  def set_target_options
    target_options = Target.where(course: @course).where.not(id: @target.id).order(:name)
    @target_options = target_options.select do |target|
      result = true
      until target.parent.nil?
        if target.parent == @target
          result = false
        end
        target = target.parent
      end
      result
    end
  end
end
