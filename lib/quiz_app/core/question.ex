defmodule QuizApp.Core.Question do
  @moduledoc """
  This module provides functionalities for handling quiz questions.

  Struct description:
  - `asked`(string): The asked question.
  - `template`(Template): The template used to generate the question.
  - `substitutions`(%{substitution: any}): The values chosen for each substitution field in a template.
  """

  alias QuizApp.Core.Template

  defstruct [:asked, :template, :substitutions]

  def new(%Template{} = template) do
    template.generators
    |> Enum.map(&build_substitution/1)
    |> evaluate(template)
  end

  defp compile(%Template{} = template, substitutions) do
    template.compiled
    |> Code.eval_quoted(assigns: substitutions)
    |> elem(0)
  end

  defp evaluate(substitutions, template) do
    %__MODULE__{
      asked: compile(template, substitutions),
      template: template,
      substitutions: substitutions
    }
  end

  defp build_substitution({name, choices_or_generator}) do
    {name, choose(choices_or_generator)}
  end

  defp choose(choices) when is_list(choices) do
    Enum.random(choices)
  end

  defp choose(generator) when is_function(generator) do
    generator.()
  end
end
