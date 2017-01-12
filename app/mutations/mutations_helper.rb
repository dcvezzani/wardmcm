module MutationsHelper
  def clean(value, *actions, &blk)
    if blk.nil?
      actions.each do |action|
        value = send(action, value)
      end
    else
      value = send(actions[0], value, &blk)
    end
    value
  end

  def clean_string(str, &blk)
    return str if str.nil?

    re = /^[^a-zA-Z0-9\(\)]*(.*?)[^a-zA-Z0-9\(\)]*$/
    lines = str.to_s.split(/[\r\n]+/)

    if blk.nil?
      clean_lines = lines.map{|line| line.gsub(re, '\1')}
    else
      actions = blk.call

      clean_lines = lines.map do |line|
        line.gsub!(re, '\1')
        actions.each do |action|
          line = send(action, line)
        end
        line
      end
    end

    clean_lines.join("\n")
  end

  def capitalize_string(str)
    capitalized_terms = str.to_s.split(/ +/).map(&:capitalize)
    capitalized_terms.join(" ")
  end

  def capitalize_first_char(str)
    if str
      "#{str[0].upcase}#{str[1...str.length]}"
    else
      str
    end
  end
end
