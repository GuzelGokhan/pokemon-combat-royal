class AvailabilityValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    decks = Deck.where(["pokemon_id =?", record.pokemon_id])
    date_ranges = decks.map { |b| b.start_date..b.end_date }

    date_ranges.each do |range|
      if range.include? value
        record.errors.add(attribute, "not available")
      end
    end
  end
end