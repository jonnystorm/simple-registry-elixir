defmodule SimpleRegistry do
  use GenServer

  def start_link(opts \\ [name: __MODULE__]) do
    GenServer.start_link __MODULE__, %{}, opts
  end

  @spec deregister(pid, any) :: :ok
  def deregister(pid, key) do
    GenServer.call pid, {:deregister, key}
  end

  @spec register(pid, any, any) :: :ok | {:error, :eexist}
  def register(pid, key, value) do
    GenServer.call pid, {:register, key, value}
  end

  @spec retrieve(pid, any) :: {:ok, any} | {:error, :enoent}
  def retrieve(pid, key) do
    GenServer.call pid, {:retrieve, key}
  end

  def handle_call({:deregister, key}, _, registry) do
    {:reply, :ok, Map.delete(registry, key)}
  end

  def handle_call({:register, key, value}, _, registry) do
    if Map.has_key?(registry, key) do
      {:reply, {:error, :eexist}, registry}

    else
      {:reply, :ok, Map.put_new(registry, key, value)}
    end
  end

  def handle_call({:retrieve, key}, _, registry) do
    case Map.fetch(registry, key) do
      {:ok, value} ->
        {:reply, {:ok, value}, registry}

      :error ->
        {:reply, {:error, :enoent}, registry}
    end
  end
end
