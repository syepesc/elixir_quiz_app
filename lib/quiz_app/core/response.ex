defmodule QuizApp.Core.Response do
  @moduledoc """
  This module provides functionalities for handling quiz responses.

  Struct description:
  - `quiz_title`(string): The title of the quiz.
  - `template_name`(atom): The name of the template.
  - `to`(string): The question being answered.
  - `email`(string): The email of the respondent.
  - `answer`(string): The answer given.
  - `correct`(boolean): Whether the answer is correct.
  - `timestamp`(DateTime): The time the response was submitted.
  """

  defstruct [:quiz_title, :template_name, :to, :email, :answer, :correct, :timestamp]
end
