alias QuizApp.Examples.Math
alias QuizApp.Boundary.QuizSession

now = DateTime.utc_now() |> IO.inspect()

five_seconds_from_now = DateTime.add(now, 5) |> IO.inspect()

one_minute_from_now = DateTime.add(now, 60) |> IO.inspect()

quiz = Math.quiz_fields() |> IO.inspect()

templates = [Math.template_fields()] |> IO.inspect()

QuizApp.schedule_quiz(quiz, templates, five_seconds_from_now, one_minute_from_now) |> IO.inspect()
QuizApp.take_quiz(quiz, "example@example.com") |> IO.inspect()
QuizApp.take_quiz(quiz.title, "example2@example.com") |> IO.inspect()

QuizSession.active_sessions_for(quiz.title)
