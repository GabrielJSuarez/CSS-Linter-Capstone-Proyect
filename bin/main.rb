# frozen_string_literal: true

# Caller

require_relative '../lib/css_caller'

def run_linter
  error_message = []
  call_file = Invoker.new
  file = call_file.file_data
  call_file.test_caller(file, error_message)
  error_message
end

def create_report()
  errors = 0
  report = run_linter()
  if report.length > 0
    report.each do |x|
      errors += 1
      puts "#{errors} - #{x}" 
    end
  else
    puts "No error found in file"
  end
end

create_report()


