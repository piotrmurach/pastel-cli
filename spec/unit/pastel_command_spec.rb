# frozen_string_literal: true

RSpec.describe "pastel command" do
  it "runs without arguments and shows help" do
    expect(`pastel`).to match(/Usage: pastel \[options\]/)
    expect($?.exitstatus).to eq(0)
  end

  it "runs with --help/-h flags" do
    out = <<-EOS
Usage: pastel [options]
    -f, --force                      Forces string coloring regardless whether terminal supports ANSI escape color sequences or not
    -s, --styles                     Prints all available color and style names
    -h, --help                       Display help
    EOS
    expect(`pastel --help`).to eq(out)
    expect($?.exitstatus).to eq(0)
  end

  it "runs with text only" do
    expect(`pastel foo`).to match(/foo/)
    expect($?.exitstatus).to eq(0)
  end

  it "runs with foreground option" do
    expect(`pastel green foo --force`).to match(/\e\[32mfoo\e\[0m/)
    expect($?.exitstatus).to eq(0)
  end

  it "runs with foreground & background options" do
    expect(`pastel -f green on_red foo`).to match(/\e\[32;41mfoo\e\[0m/)
    expect($?.exitstatus).to eq(0)
  end

  it "runs with foreground & background & style options" do
    expect(`pastel -f green on_red bold foo`).to match(/\e\[32;41;1mfoo\e\[0m/)
    expect($?.exitstatus).to eq(0)
  end

  it "runs with piped input" do
    expect(`echo foo | pastel green -f`).to match(/\e\[32mfoo\s*\e\[0m/)
    expect($?.exitstatus).to eq(0)
  end

  it "runs with --force option" do
    expect(`pastel --force green foo`).to match(/\e\[32mfoo\e\[0m/)
    expect($?.exitstatus).to eq(0)
  end

  it "preserves multiline content", unless: RSpec::Support::OS.windows? do
    output = `echo "foo\nbar" | pastel green -f`
    expect(output).to match(/\e\[32m\s*foo\nbar\s*\e\[0m/)
    expect($?.exitstatus).to eq(0)
  end

  it "displays information when wrong styles are used" do
    output = `pastel unknown foo -f`
    expect(output).to match(/^Bad style or unintialized constant/)
    expect($?.exitstatus).to eq(1)
  end

  it "shows available styles", unless: RSpec::Support::OS.windows? do
    output = `pastel --styles -f`
    expect(output).to match(/Swatch    Name\n\e\[1m◼ pastel\e\[0m  bold\n\e\[2m◼ pastel\e\[0m  dark/)
  end
end
