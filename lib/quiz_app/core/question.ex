defmodule QuizApp.Core.Question do
  @moduledoc """
  This module provides functionalities for handling quiz questions.

  Struct description:
  - `asked`(string): The asked question.
  - `template`(Template): The template used to generate the question.
  - `substitutions`(%{substitution: any}): The values chosen for each substitution field in a template.
  """

  defstruct [:asked, :template, :substitutions]
end
