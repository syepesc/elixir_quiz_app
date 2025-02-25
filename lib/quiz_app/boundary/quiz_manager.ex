defmodule QuizApp.Boundary.QuizManager do
  use GenServer
  alias QuizApp.Core.Quiz

  # ###########################################################################
  # Public API
  # ###########################################################################

  def build_quiz(manager \\ __MODULE__, quiz_fields) do
    GenServer.call(manager, {:build_quiz, quiz_fields})
  end

  def add_template(manager \\ __MODULE__, quiz_title, template_fields) do
    GenServer.call(manager, {:add_template, quiz_title, template_fields})
  end

  def lookup_quiz_by_title(manager \\ __MODULE__, quiz_title) do
    GenServer.call(manager, {:lookup_quiz_by_title, quiz_title})
  end

  # ###########################################################################
  # GenServer callbacks
  # ###########################################################################

  def init(quizzes) when is_map(quizzes) do
    {:ok, quizzes}
  end

  def init(_quizzes), do: {:error, "quizzes must be a map"}

  def handle_call({:build_quiz, quiz_fields}, _from, state) do
    quiz = Quiz.new(quiz_fields)
    new_state = Map.put(state, quiz.title, quiz)
    {:reply, :ok, new_state}
  end

  def handle_call({:add_template, quiz_title, template_fields}, _from, state) do
    new_state =
      Map.update!(state, quiz_title, fn quiz ->
        Quiz.add_template(quiz, template_fields)
      end)

    {:reply, :ok, new_state}
  end

  def handle_call({:lookup_quiz_by_title, quiz_title}, _from, state) do
    {:reply, state[quiz_title], state}
  end
end
