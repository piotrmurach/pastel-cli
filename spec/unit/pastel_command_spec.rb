# encoding: utf-8

RSpec.describe 'pastel command' do

  it 'runs without arguments and shows help' do
    expect {
      system('pastel')
    }.to output(/PASTEL\(1\)/).to_stdout_from_any_process
  end

  it 'runs with text only' do
    expect {
      system('pastel foo')
    }.to output(/foo/).to_stdout_from_any_process
  end

  it 'runs with foreground option' do
    expect {
      system('pastel green foo')
    }.to output(/\e\[32mfoo\e\[0m/).to_stdout_from_any_process
  end

  it "runs with foreground & background options" do
    expect {
      system('pastel green on_red foo')
    }.to output(/\e\[32;41mfoo\e\[0m/).to_stdout_from_any_process
  end

  it "runs with foreground & background & style options" do
    expect {
      system('pastel green on_red bold foo')
    }.to output(/\e\[32;41;1mfoo\e\[0m/).to_stdout_from_any_process
  end

  it "runs with piped input" do
    expect {
      system('echo foo | pastel green')
    }.to output(/\e\[32mfoo\e\[0m/).to_stdout_from_any_process
  end
end
