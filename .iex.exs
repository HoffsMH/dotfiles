# require Tiex our testing module
import_file("~/.tiex.exs")

# run mix tasks by name
# mx("format")
# also you can run &r/0 to recompile and format
import_file("~/.miex.exs")

IO.puts("current PID is:")
IO.inspect(self())

# can use this thing to conditionally import modules that are already defined loaded and compiled
# import_if_available Tiex
