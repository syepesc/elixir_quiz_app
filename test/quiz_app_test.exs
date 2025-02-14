defmodule QuizAppTest do
  use ExUnit.Case
  doctest QuizApp

  test "greets the world" do
    assert QuizApp.hello() == :world
  end
end
