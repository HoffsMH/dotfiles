Code.compiler_options(ignore_module_conflict: false)

defmodule M do
  def mx(task) do
    Mix.Task.reenable task
    Mix.Task.run task, []
  end

  def mx(task, args) do
    Mix.Task.reenable task
    Mix.Task.run task, args
  end

  def mxf() do
    if File.regular?("./formatter.exs") do
      mx("format")
    end
  end

  def r do
    mxf()
    IEx.Helpers.recompile()
  end

  def lookup(call) do
    [Enum, Map, List, String, Kernel]
    |> Enum.group_by(&(&1), &lookup(&1, call))
  end

  def lookup(module, call) do
    module.module_info(:exports)
    |> Enum.filter(&(export_similar?(&1, call)))
  end

  def export_similar?({export, _}, call) do
    String.jaro_distance(Atom.to_string(export), call) > 0.60
  end

  def start_testing() do
    ExUnit.start()
    Code.eval_file("test/test_helper.exs", File.cwd!())
    :ok
  end

  def mt(path \\ "./test", line \\ nil)

  def mt(path, line) when is_binary(path) do
    env = Mix.env()
    Mix.env(:test)

    r()
    result = run_the_tests(path, line)

    Mix.env(env)
    result
  end

  defp run_the_tests(path, line) do
    start_testing()
    if line do
      ExUnit.configure(exclude: [:test], include: [line: line], timeout: 600_000)
    else
      ExUnit.configure(exclude: [], include: [], timeout: 600_000)
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

    ExUnit.run()
  end

  def v6_or_higher?() do
    System.version()
    |> String.split(".")
    |> Enum.at(1)
    |> String.to_integer >= 6
  end
end
