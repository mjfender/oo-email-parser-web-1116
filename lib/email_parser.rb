require 'pry'
# Build a class EmailParser that accepts a string of unformatted 
# emails. The parse method on the class should separate them into
# unique email addresses. The delimiters to support are commas (',')
# or whitespace (' ').

class EmailParser
  attr_accessor :email

  def initialize(emails)
    @emails = emails
    parse
  end

  def parse
    @emails.include?(",") ? @email = @emails.split(", ") : @email = @emails.split(" ")
    @email.each_with_index do |item, index|
      if item.include?(" ")
        dumb_emails = item.split(" ")
        @email.delete_at(index)
        dumb_emails.reverse.each { |dumb_email| @email.insert(index, dumb_email) }
      end
    end
    @email.uniq
  end
end