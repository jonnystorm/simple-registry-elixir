defmodule SimpleRegistryTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, pid} = SimpleRegistry.start_link
    {:ok, registry: pid}
  end

  test "stores a value", %{registry: pid} do
    assert {:error, :enoent} = SimpleRegistry.retrieve pid, "a_key"

    assert :ok = SimpleRegistry.register pid, "a_key", 1
    assert {:ok, 1} = SimpleRegistry.retrieve pid, "a_key"

    assert :ok = SimpleRegistry.deregister pid, "a_key"
  end
end
