# frozen_string_literal: true

RSpec.describe "pastel command" do
  let(:cmd) { RSpec::Support::OS.windows? ? "pastel" : "exe/pastel" }

  it "runs without arguments and shows help" do
    expect(`#{cmd}`).to match(/Usage: pastel \[options\]/)
    expect($?.exitstatus).to eq(0)
  end

  it "runs with --help/-h flags" do
    out = <<-EOS
Usage: pastel [options] style [style ...] [text]
    -d delim                         Specify character to use to split input coloring
    -f, --force                      Force output coloring regardless of terminal support
    -n                               Skip printing the trailing newline character
    -s, --styles                     Print all available color and style names
    -h, --help                       Print this message and exit
    -v, --version                    Print version information and exit
    EOS
    expect(`#{cmd} --help`).to eq(out)
    expect($?.exitstatus).to eq(0)
  end

  it "handles invalid option without raising" do
    output = `#{cmd} --unknown`
    expect(output).to eq("invalid option: --unknown\n")
    expect($?.exitstatus).to eq(1)
  end

  it "runs with text only" do
    expect(`#{cmd} foo`).to match(/foo/)
    expect($?.exitstatus).to eq(0)
  end

  it "runs with foreground option" do
    expect(`#{cmd} green foo --force`).to match(/\e\[32mfoo\e\[0m/)
    expect($?.exitstatus).to eq(0)
  end

  it "runs with foreground & background options" do
    expect(`#{cmd} -f green on_red foo`).to match(/\e\[32;41mfoo\e\[0m/)
    expect($?.exitstatus).to eq(0)
  end

  it "runs with foreground & background & style options" do
    expect(`#{cmd} -f green on_red bold foo`).to match(/\e\[32;41;1mfoo\e\[0m/)
    expect($?.exitstatus).to eq(0)
  end

  it "runs with piped input" do
    expect(`echo foo | #{cmd} green -f`).to match(/\e\[32mfoo\s*\e\[0m/)
    expect($?.exitstatus).to eq(0)
  end

  it "runs with --force option" do
    expect(`#{cmd} --force green foo`).to eq("\e[32mfoo\e[0m\n")
    expect($?.exitstatus).to eq(0)
  end

  it "preserves multiline content", unless: RSpec::Support::OS.windows? do
    output = `echo "foo\nbar" | #{cmd} green -f`
    expect(output).to match(/\e\[32m\s*foo\nbar\s*\e\[0m/)
    expect($?.exitstatus).to eq(0)
  end

  it "displays information when wrong styles are used" do
    output = `#{cmd} unknown foo -f`
    expect(output).to match(/^Bad style or unintialized constant/)
    expect($?.exitstatus).to eq(1)
  end

  it "shows available styles", unless: RSpec::Support::OS.windows? do
    output = `#{cmd} --styles -f`
    expect(output).to match(/Swatch    Name\n\e\[1m◼ pastel\e\[0m  bold\n\e\[2m◼ pastel\e\[0m  dark/)
  end

  it "skips printing newline character" do
    output = `#{cmd} -fn green foo`
    expect(output).to eq("\e[32mfoo\e[0m")
  end

  describe "split content on delim", unless: RSpec::Support::OS.windows? do
    it "requires delim character" do
      output = `#{cmd} green foo -d`
      expect(output).to eq("missing argument: -d\n")
      expect($?.exitstatus).to eq(1)
    end

    it "splits on newline with delim separated by =" do
      output = `printf 'foo\nbar\nbaz' | #{cmd} green --force -d='\n'`
      expect(output).to match(/\e\[32mfoo\e\[0m\n\e\[32mbar\e\[0m\n\e\[32mbaz\e\[0m/)
      expect($?.exitstatus).to eq(0)
    end

    it "splits on newline with delim next to the option" do
      output = `printf "foo\nbar\nbaz" | #{cmd} green -fd'\n'`
      expect(output).to match(/\e\[32mfoo\e\[0m\n\e\[32mbar\e\[0m\n\e\[32mbaz\e\[0m/)
      expect($?.exitstatus).to eq(0)
    end

    it "splits on newline with -d option separate from delim character" do
      output = `printf "foo\nbar\nbaz" | #{cmd} green -f -d "\n"`
      expect(output).to match(/\e\[32mfoo\e\[0m\n\e\[32mbar\e\[0m\n\e\[32mbaz\e\[0m/)
      expect($?.exitstatus).to eq(0)
    end
  end
end
