require_relative '../lib/linter_suite'

# Class that calls the path of the file that we will check and all the helper methods to check sintax
class Invoker
  attr_reader :file_path
  include Linter

  def initialize
    @file_path = ARGV[0]
  end

  def get_file(file_path)
    raise LoadError, 'No file path specified in the script call (Incorrect path name?)' if file_path.nil?

    file = File.open(file_path)
    file_data = file.readlines.map(&:chomp)
    file_data
  end

  def test_caller(file_data, error_message)
    trailing_white_space?(file_data, error_message)
    block_declaration_single_line?(file_data, error_message)
    block_declaration_start?(file_data, error_message)
    block_declaration_end?(file_data, error_message)
    soft_tab_indentation?(file_data, error_message)
    space_after_colon?(file_data, error_message)
    single_line_declaration?(file_data, error_message)
    line_declaration_end?(file_data, error_message)
    comma_separated_values?(file_data, error_message)
    prefix_property_values?(file_data, error_message)
    empty_line_after_block?(file_data, error_message)
    empty_line_at_end?(file_data, error_message)
  end
end
