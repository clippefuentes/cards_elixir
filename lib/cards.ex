defmodule Cards do
  @moduledoc """
    Provides methods for creating and managing cards.
  """

  @doc """
    Creates a new card deck.
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    suits = ["Hearts", "Diamonds", "Clubs", "Spades"]

    # cards = for suit <- suits do
    #   for value <- values do
    #     "#{value} of #{suit}"
    #   end
    # end

    # List.flatten(cards)

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end

  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `hand_size` is the number of cards to be dealt.

  ## Examples

      iex > deck = Cards.create_deck
      iex > {hand, deck} = Cards.deal(deck, 1)
      iex > hand
      ["Ace of Hearts"]


  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    Check if the deck contains given card
  ## Examples
        iex > deck = Cards.create_deck
        iex > Cards.contains?(deck, "Ace of Hearts")
        true

  """
  def contains?(deck, hand) do
    Enum.member?(deck, hand)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    {status, binary} = File.read(filename)
    case status do
      :ok -> :erlang.binary_to_term binary
      :error -> "File not found"
    end
  end

  def create_hand(hand_size) do
    # deck = Cards.create_deck
    # deck = Cards.shuffle(deck)
    # hand = Cards.deal(deck, hand_size )
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
