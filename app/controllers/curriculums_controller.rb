class CurriculumsController <  ApplicationController
    def index
      @curriculums = Curriculum.all.to_a
    end

    def fetch_curriculums
      @curriculums = Curriculum.all.to_a
      render :json => @curriculums
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