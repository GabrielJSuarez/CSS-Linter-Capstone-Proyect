# frozen_string_literal: true

# Linter module with all the methods to perform checks on a css file.
module Linter
  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/PerceivedComplexity
  def trailing_white_space?(file, error_log)
    errorlog = 'trailing white space on line'

    file.each_with_index do |x, y|
      error_log << "#{errorlog} #{y + 1}" if x.end_with?(' ')
    end
    error_log
  end

  def block_declaration_single_line?(file, error_log)
    errorlog0 = 'More than one declaration in a single line, on line'

    file.each_with_index do |x, y|
      next if x.include?('}') || x == '' || x.start_with?('/*') || x.end_with?(';') || x.end_with?(' ')

      error_log << "#{errorlog0} #{y + 1}" unless x.scan(/(,|{)/).length == 1
    end
    error_log
  end

  def block_declaration_start?(file, error_log)
    errorlog1 = 'No space before opening block declaration on line'

    file.each_with_index do |x, y|
      if x.include?('{') && x.end_with?('{')
        error_log << "#{errorlog1} #{y + 1}" unless x.include?(' {')
      end
    end
    error_log
  end

  def soft_tab_indentation?(file, error_log)
    errorlog2 = 'Expected indentation of two spaces in declaration on line'

    file.each_with_index do |x, y|
      if x.include?('{') || x.include?('}') || x == '' || x.start_with?('/*') || x.end_with?(',') || x.end_with?(' ')
        next
      end

      error_log << "#{errorlog2} #{y + 1}" unless x.start_with?('  ')
    end
    error_log
  end

  def block_declaration_end?(file, error_log)
    errorlog3 = 'Closing bracket should be on an empty line, on line'

    file.each_with_index do |x, y|
      if x.include?('}')
        error_log << "#{errorlog3} #{y + 1}" unless x == '}'
      end
    end
    error_log
  end

  def space_after_colon?(file, error_log)
    errorlog4 = 'Empty space expected after colon (:) in declaration on line'

    file.each_with_index do |x, y|
      if x.include?('{') || x.include?('}') || x == '' || x.start_with?('/*') || x.end_with?(',') || x.end_with?(' ')
        next
      end

      error_log << "#{errorlog4} #{y + 1}" unless x.include?(': ')
    end
    error_log
  end

  def single_line_declaration?(file, error_log)
    errorlog5 = 'Declaration should be in a single line, on line'

    file.each_with_index do |x, y|
      next if x.include?('{') || x.include?('}') || x == '' || x.start_with?('/*') || x.end_with?(',')

      error_log << "#{errorlog5} #{y + 1}" unless x.scan(/;/).length < 2
    end
    error_log
  end

  def line_declaration_end?(file, error_log)
    errorlog6 = 'Declaration should end with a semi-colon (Trailing white space?), on line'

    file.each_with_index do |x, y|
      next if x.include?('{') || x.include?('}') || x == '' || x.start_with?('/*') || x.end_with?(',')

      error_log << "#{errorlog6} #{y + 1}" unless x.end_with?(';')
    end
    error_log
  end

  def comma_separated_values?(file, error_log)
    errorlog7 = 'Expected space after comma separated values in declaration, on line'

    file.each_with_index do |x, y|
      next if x.include?('{') || x.include?('}') || x == '' || x.start_with?('/*') || x.end_with?(',')

      error_log << "#{errorlog7} #{y + 1}" unless x.scan(/, */).all? { |z| z.length == 2 }
    end
    error_log
  end

  def prefix_property_values?(file, error_log)
    errorlog8 = 'Unexpected prefix property float value on line'

    file.each_with_index do |x, y|
      next if x.include?('{') || x.include?('}') || x == '' || x.start_with?('/*') || x.end_with?(',')

      error_log << "#{errorlog8} #{y + 1}" if x.include?('0.')
    end
    error_log
  end

  def empty_line_after_block?(file, error_log)
    errorlog9 = 'Expecting empty line after block closure, on line'

    file.each_with_index do |x, y|
      next unless x.include?('}')

      error_log << "#{errorlog9} #{y + 1}" unless file[y + 1] == ''
    end
    error_log
  end

  def empty_line_at_end?(file, error_log)
    errorlog10 = 'Expecting empty line at the end of the file, on line'

    error_log << "#{errorlog10} #{file.length}" unless file.last == ''

    error_log
  end
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/PerceivedComplexity
end
