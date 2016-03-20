module ArticlesHelper
  # ask maurice about mass assignment
  def article_params
    params.require(:article).permit(:title, :body, :tag_list, :image)
  end
end
