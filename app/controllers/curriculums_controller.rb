class CurriculumsController <  ApplicationController
    def index
      @curriculums = Curriculum.all.to_a
      form_html = render_to_string :partial => 'curriculums_home',locals: { curriculum: @curriculums } 
        render :json => {
          :status => 200,
          :body => form_html
        }
    end

    def new
      @curriculums = Curriculum.new
    end

    def create
      @curriculums = Curriculum.new(curriculum_params)
      if @curriculums.save
        redirect_to "/curriculums"
      else
        redirect_to "/curriculums/new"
      end
    end

    private
      def curriculum_params
        params.require(:curriculum).permit(:name, :content, :path)
      end
end