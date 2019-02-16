defmodule M do
  def mx(task) do
    Mix.Task.reenable task
    Mix.Task.run task, []
  end

  def mx(task, args) do
    Mix.Task.reenable task
    Mix.Task.run task, args
  end

  def r do
    mx("format")
    IEx.Helpers.recompile()
  end

  def lookup(module, call) do
    module.module_info(:exports)
    |> Enum.filter(&(export_similar?(&1, call)))
  end

  def export_similar?({export, _}, call) do
    String.jaro_distance(Atom.to_string(export), call) > 0.5
  end
end
