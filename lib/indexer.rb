class Indexer

  def generate_shift_index(enig_key, date)
    shift_index(key_index(enig_key), offset_index(date))
  end

  def key_index(enig_key)
    { :a => enig_key[0..1],
      :b => enig_key[1..2],
      :c => enig_key[2..3],
      :d => enig_key[3..4]}
  end


  def offset_index(date)
    date_squared = (date.to_i * date.to_i).to_s
    { :a => date_squared[-4],
      :b => date_squared[-3],
      :c => date_squared[-2],
      :d => date_squared[-1] }
  end

  def shift_index(enig_key, offset)
    enig_key.merge(offset) do |key, enig_key_val, offset_val|
      enig_key_val.to_i + offset_val.to_i
    end
  end

end
