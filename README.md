# rb.pdf
Disguise any Ruby script as a PDF file.

This is a proof-of-concept to show that it is possible for a PDF to be both a valid PDF and an executable Ruby script.

## Usage

```sh
# in ruby.rb
puts "Hello world!"

# Combine the PDF and Ruby file
ruby script.rb pdf_file_path ruby_file_path
```

This will generate a new file `output.pdf` from the original PDF and adds the ruby script.

Execute the original ruby script like this:

```sh
ruby output.pdf
# => 
# Hello world!
```

## How it works
The script wraps the content of the PDF in a multiline comment

```sh
=begin
# PDF data here
=end
# ruby script here
```

PDF parsers typically ignore everything up untill the `%PDF-` header.
Since the whole PDF binary is embedded in the ruby comment it gets ignored by Ruby interpreter.
