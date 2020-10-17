# frozen_string_literal: true

require 'rainbow'
require_relative '../lib/css_caller'

def run_linter
  error_message = []
  call_file = Invoker.new
  file = call_file.file_data
  call_file.test_caller(file, error_message)
  error_message
end

def create_report
  errors = 0
  report = run_linter
  if report.length.positive?
    report.each do |x|
      errors += 1
      puts Rainbow("#{errors} - #{x}").red
    end
  else
    puts Rainbow('No error found in file').green
  end
end

create_report
