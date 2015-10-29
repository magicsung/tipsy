class ApiV1::CategoriesController < ApiController

  def index
    @category = Category.all
  end

end
