defmodule QuizApp.Core.Quiz do
  @moduledoc """
    This module provides functionalities for handling quizzes.

  Struct description:
  - `title`(string): The title of the quiz.
  - `mastery`(integer): The number of questions a user get to get right to gain mastery level.
  - `templates`(map): The master list of templates, by category.
  - `used`(list): The template we have used in, this cycle, that have not yet been mastered.
  - `current_question`(integer): The current question presented to the user.
  - `last_response`(string): The last response from the user.
  - `record`(map): The number of correct answers in a row given by the user per template.
  - `mastered`(list): The templates that have been mastered by the user.
  """

  defstruct title: nil,
            mastery: 3,
            templates: %{},
            used: [],
            current_question: nil,
            last_response: nil,
            record: %{},
            mastered: []
end
