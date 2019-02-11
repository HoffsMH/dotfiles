defmodule Tiex do
  def start_testing() do
    ExUnit.start()
    Code.eval_file("test/test_helper.exs", File.cwd!())
    :ok
  end

  def mt(path \\ "./test", line \\ nil)

  def mt(path, line) when is_binary(path) do
    env = Mix.env()
    Mix.env(:test)
    start_testing()
    if line do
      ExUnit.configure(exclude: [:test], include: [line: line])
    else
      ExUnit.configure(exclude: [], include: [])
    end

    if File.regular?(path) do
     Code.load_file(path)
    else
      path
      |> Path.join("**/*.exs")
      |> Path.wildcard()
      |> Enum.map(&Code.load_file/1)
    end


    if v6_or_higher?() do
      ExUnit.Server.modules_loaded()
    else
      ExUnit.Server.cases_loaded()
    end

    result = ExUnit.run()
    Mix.env(env)
    result
  end

  def v6_or_higher?() do
    System.version()
    |> String.split(".")
    |> Enum.at(1)
    |> String.to_integer >= 6
  end
end
