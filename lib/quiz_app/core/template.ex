defmodule QuizApp.Core.Template do
  @moduledoc """
  This module provides functionalities for handling quiz templates.

  Struct description:
  - `name`(atom): The name of the template.
  - `category`(atom): Grouping of questions of the same name.
  - `instructions`(string): String that tells the user how to answer questions of this type.
  - `raw`(string): The raw template code before compilation.
  - `compiled`(macro): The compiled template for execution.
  - `generators`(%{substitution: list | function}): The generator for each
    substitution in a tempalte. Each is a list of elements or a function.
    Generating a tempalte substitution will either fire the function or pick a random irem from the list.
  - `checker`(function(substitutions, string) -> boolean): The function that checks if a given answer is correct.
  """

  defstruct [:name, :category, :instructions, :raw, :compiled, :generators, :checker]
end
