require 'pry-meta'

class Post < Sequent::AggregateRoot
  def initialize(command)
    super(command.aggregate_id)
    apply PostAdded
    apply PostAuthorChanged, author_aggregate_id: command.author_aggregate_id
    apply PostTitleChanged, title: command.title
    apply PostContentChanged, content: command.content
  end

  on PostAdded do
  end

  on PostAuthorChanged do |event|
    @author = event.author
  end

  on PostTitleChanged do |event|
    @title = event.title
  end

  on PostContentChanged do |event|
    @content = event.content
  end

  def publish(publication_date)
    raise PostAlreadyPubishedError if @publication_date.any?

    apply PostPublished, publication_date: publication_date
  end
end
