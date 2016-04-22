class CurriculumLabelsController < ApplicationController

  def index
    @labels = CurriculumLabel.all
  end

  def new
    @labels = CurriculumLabel.new
  end

  def create
    @label = CurriculumLabel.new(label_params)
    if @label.save
      redirect_to "/curriculum_labels"
    else
      redirect_to "/curriculum_labels/new"
    end
  end

  def destroy
    @label = CurriculumLabel.find(params[:id])
    @label.destroy
    redirect_to "/curriculum_labels"
  end

  # Android 端获取Label 信息
  def fetch_curriculum_labels
    @labels = CurriculumLabel.all
    render :json => @labels
  end

  private
    def label_params
      params.require(:curriculum_label).permit(:label, :catalogue)
    end
end