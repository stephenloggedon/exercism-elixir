defmodule BoutiqueInventory do
  def sort_by_price(inventory), do: Enum.sort_by(inventory, &(&1.price), :asc)

  def with_missing_price(inventory), do: Enum.filter(inventory, &(is_nil(&1.price)))

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn i -> Map.update!(i, :name, &(String.replace(&1, old_word, new_word))) end )
  end

  def increase_quantity(item, count) do
    %{item | quantity_by_size: Map.new(
        item.quantity_by_size,
        fn {size, inv} -> {size, inv + count} end
        )
      }
  end
  
  def total_quantity(item) do
    Map.get(item, :quantity_by_size, %{})
    |> Enum.reduce(0, &(elem(&1, 1) + &2))
  end
end
