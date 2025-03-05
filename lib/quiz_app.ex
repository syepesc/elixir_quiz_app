defmodule QuizApp do
  alias QuizApp.Boundary.{QuizManager, QuizSession, Proctor}
  alias QuizApp.Boundary.{TemplateValidator, QuizValidator}
  alias QuizApp.Core.Quiz

  def schedule_quiz(quiz, templates, start_at, end_at) do
    with :ok <- QuizValidator.errors(quiz),
         true <- Enum.all?(templates, &(:ok == TemplateValidator.errors(&1))),
         :ok <- Proctor.schedule_quiz(quiz, templates, start_at, end_at),
         do: :ok,
         else: (error -> error)
  end

  def build_quiz(fields) do
    with :ok <- QuizValidator.errors(fields),
         :ok <- GenServer.call(QuizManager, {:build_quiz, fields}),
         do: :ok,
         else: (error -> error)
  end

  def add_template(title, fields) do
    with :ok <- TemplateValidator.errors(fields),
         :ok <- GenServer.call(QuizManager, {:add_template, title, fields}),
         do: :ok,
         else: (error -> error)
  end

  def take_quiz(title, email) do
    with %Quiz{} = quiz <- QuizManager.lookup_quiz_by_title(title),
         {:ok, _} <- QuizSession.take_quiz(quiz, email) do
      {title, email}
    else
      error -> error
    end
  end

  def select_question({_title, _email} = name) do
    GenServer.call(QuizSession.via(name), :select_question)
  end

  def answer_question({_title, _email} = name, answer) do
    GenServer.call(QuizSession.via(name), {:answer_question, answer})
  end
end
