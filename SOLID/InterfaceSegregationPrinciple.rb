# Define Printable module
module Printable
  def print(document)
    raise NotImplementedError, 'Subclasses must implement the print method'
  end
end

# Define Scannable module
module Scannable
  def scan
    raise NotImplementedError, 'Subclasses must implement the scan method'
  end
end

# Define Faxable module
module Faxable
  def fax(document)
    raise NotImplementedError, 'Subclasses must implement the fax method'
  end
end

# Implement BasicInkjetPrinter class including Printable and Scannable modules
class BasicInkjetPrinter
  include Printable
  include Scannable

  def print(document)
    puts "Printing #{document} using basic inkjet printer"
  end

  def scan
    puts "Scanning using basic inkjet printer"
  end
end

# Implement HighEndOfficePrinter class including Printable, Scannable, and Faxable modules
class HighEndOfficePrinter
  include Printable
  include Scannable
  include Faxable

  def print(document)
    puts "Printing #{document} using high end office printer"
  end

  def scan
    puts "Scanning using high end office printer"
  end

  def fax(document)
    puts "Faxing #{document} using high end office printer"
  end
end

# Client code
# BasicInkjetPrinter
basic_printer = BasicInkjetPrinter.new
basic_printer.print("Sample Document")
basic_printer.scan

# HighEndOfficePrinter
office_printer = HighEndOfficePrinter.new
office_printer.print("Important Report")
office_printer.scan
office_printer.fax("Confidential Memo")
