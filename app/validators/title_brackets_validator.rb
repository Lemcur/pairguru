class TitleBracketsValidator < ActiveModel::Validator
  def validate(record)
    title = record.title
    bracket_pairs = { "(" => ")", "[" => "]", "{" => "}" }
    arr = []

    if empty_brackets?(title)
      record.errors.add(title, "Brackets cannot be empty")
    end

    title.each_char do |char|
      if bracket_pairs.keys.include?(char)
        arr << char
      elsif bracket_pairs.values.include?(char)
        if arr.empty? || bracket_pairs[arr.pop] != char
          record.errors.add(title, "Unnecessary brackets close")
        end
      end
    end

    record.errors.add(title, "Unclosed brackets") unless arr.empty?

  end

  def empty_brackets?(string)
    %w[() [] {}].any? { |x| string.include?(x) }
  end
end