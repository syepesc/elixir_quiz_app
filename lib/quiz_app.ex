defmodule QuizApp do
  @moduledoc """
  Taken from the book (page 50):

  "
  Initially, all questions will start in `templates`. The quiz will select a question,
  and that question will be moved from `templates` to `used`. After all questions get asked
  onece, unless they are mastered in the meantime, they will move back form `used` to `templates`.

  Getting an answer right will increment a record, and getting enough right in
  a row will move a template from `used` to `mastered`. Getting an answer wrong will
  reset the record.
  "
  """

  @doc """
  Hello world.

  ## Examples

      iex> QuizApp.hello()
      :world

  """
  def hello do
    :world
  end
end
