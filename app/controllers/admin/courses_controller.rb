class Admin::CoursesController < Admin::BaseController

  def index
    if params[:q].blank?
      @courses = Course.all
    else
      @courses = Course.where(:course_name.like => "%#{params[:q].strip}%")
    end

    respond_to do |format|
      format.html
      format.json {render :json => @courses.collect{|course| {:id => course.id, :name => course.course_name} }.to_json }
    end
  end

  def new
    @course = Course.new
  end

  def edit
    @course = Course.find(params[:id])
  end

  def show
    @course = Course.find(params[:id])
  end

  def create
    @course = Course.new(params[:course])
    if @course.save
      redirect_to({:action => 'index'}, :notice => t('label.save_success'))
    else
      render 'new'
    end
  end

  def satisfy_for_test(values)
    values ||= []
    values.flatten!
    return values if (values.size == 0) || (values[0].to_i > 0)

    eval(values[0])

  end

  def update
    @course = Course.find(params[:id])

    params[:course][:catalog_ids] = satisfy_for_test(params[:course][:catalog_ids])

    # remove previous avatar if upload new one.
    @course.remove_avatar! unless params[:course][:avatar].nil?

    if @course.update_attributes(params[:course])
      redirect_to({:action => 'index'}, :notice => t("label.save_success"))
    else
      render 'new'
    end
  end

  def destroy
    @course = Course.find(params[:id])
    if @course.destroy
      redirect_to({:action => 'index'}, :notice => t("label.delete_success"))
    else
      redirect_to({:action=>'index'})
    end
  end

end
