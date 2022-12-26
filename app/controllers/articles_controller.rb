# Функции данного контроллера вызываются в соответствии с указанными сопоставлениями путей с функциями контроллеров в файле "config.routes.rb"
# Функции контроллера могут вызывать вид явно, либо находит вид по умолчанию с помощью соглашения имён, либо trigger an HTTP response
class ArticlesController < ApplicationController
  # The "index" action is empty. When an action does not explicitly render a view (or otherwise trigger an HTTP response), Rails will automatically render a view that matches the name of the controller and action.
  def index
    # Функция контроллера обращается к классу модели который с помощью миграции, которую находит с помощью соглашения имён и извлекает записи из базы данных в руби объект
    # Файлы вида по соглашению "articles" из директории "views/articles" получают доступ к переменным экземпляра данного класса "ArticlesController"
    @articles = Article.all
  end
end
