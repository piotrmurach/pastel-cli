# frozen_string_literal: true

RSpec.describe "pastel command" do
  it "runs without arguments and shows help" do
    expect(`pastel`).to match(/Usage: pastel \[options\]/)
    expect($?.exitstatus).to eq(0)
  end

  it "runs with --help/-h flags" do
    out = <<-EOS
Usage: pastel [options] style [style ...] [text]
    -d delim                         Specifies character to use to split input coloring
    -f, --force                      Forces string coloring regardless of terminal support
    -s, --styles                     Prints all available color and style names
    -h, --help                       Prints this message and exists
    -v, --version                    Prints Pastel version
    EOS
    expect(`pastel --help`).to eq(out)
    expect($?.exitstatus).to eq(0)
  end

  it "handles invalid option without raising" do
    output = `pastel --unknown`
    expect(output).to eq("invalid option: --unknown\n")
    expect($?.exitstatus).to eq(1)
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

  describe "split content on delim", unless: RSpec::Support::OS.windows? do
    it "requires delim character" do
      output = `pastel green foo -d`
      expect(output).to eq("missing argument: -d\n")
      expect($?.exitstatus).to eq(1)
    end

    it "splits on newline with delim separated by =" do
      output = `printf 'foo\nbar\nbaz' | pastel green --force -d='\n'`
      expect(output).to match(/\e\[32mfoo\e\[0m\n\e\[32mbar\e\[0m\n\e\[32mbaz\e\[0m/)
      expect($?.exitstatus).to eq(0)
    end

    it "splits on newline with delim next to the option" do
      output = `printf "foo\nbar\nbaz" | pastel green -fd'\n'`
      expect(output).to match(/\e\[32mfoo\e\[0m\n\e\[32mbar\e\[0m\n\e\[32mbaz\e\[0m/)
      expect($?.exitstatus).to eq(0)
    end

    it "splits on newline with -d option separate from delim character" do
      output = `printf "foo\nbar\nbaz" | pastel green -f -d "\n"`
      expect(output).to match(/\e\[32mfoo\e\[0m\n\e\[32mbar\e\[0m\n\e\[32mbaz\e\[0m/)
      expect($?.exitstatus).to eq(0)
    end
  end
end
