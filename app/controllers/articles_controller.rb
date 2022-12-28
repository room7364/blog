# Функции данного контроллера вызываются в соответствии с указанными сопоставлениями путей с функциями контроллеров в файле "config.routes.rb"
# Функции контроллера могут вызывать вид явно, либо находит вид по умолчанию с помощью соглашения имён, либо trigger an HTTP response
class ArticlesController < ApplicationController

  # The "index" action is empty. When an action does not explicitly render a view (or otherwise trigger an HTTP response), Rails will automatically render a view that matches the name of the controller and action.
  def index
    # Функция контроллера обращается к классу модели который с помощью миграции, которую находит с помощью соглашения имён и извлекает записи из базы данных в руби объект
    # Файлы вида по соглашению "articles" из директории "views/articles" получают доступ к переменным экземпляра данного класса "ArticlesController"
    @articles = Article.all
  end

  # By default the "show" action will render "app/views/articles/show.html.erb"
  def show
    @article = Article.find(params[:id])
  end

  # Typically, in web applications, creatinga new resource is a multi-step process. First, the user requests a form to fill out. Then, the user submits the form. If there are no errors, then the resource is created and some kind of confirmation is displayed. Else, the form is redispayed with error messages, and the process is repeated.
  # In a Rails application, these steps are conventionally handled by a controller's "new" and "create" actions
  #
  # By default, the new action will render "app/views/articles/new.html.erb"
  def new
    @article = Article.new
  end
  # 
  # This action instantiates a new article with values for the title and body, and attempts to save it. If the article is saved successfully, the action redirects the browser to the article's page at "http://localhost:3000/articles/#{@article.id}". Else the action redisplays the form by rendering app/views/articles/new.html.erb with status code "422 Unprocessable Entity".
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
