# pastel(1)

## NAME

`pastel` -- color and style text in terminal

## SYNOPSIS

`pastel` \[--force\|-d delim\] style \[style ...\] \[text\]

`pastel` --styles\|-s

## DESCRIPTION

The `pastel` utility applies colors and style to terminal output. It accepts as arguments a foreground color and/or background color name and/or style name like bold followed by the text to be styled. The input can also be piped from another command.

The options are as follows:

`-d` delim

: Specifies character to use to split string input for coloring.

`-f` `--force`
: Forces string coloring regardless whether terminal supports ANSI escape color sequences or not.

`-n`
: Skips printing the trailing newline character.

`-s`, `--styles`
: Prints all available color and style names.

`-v`, `--version`
: Shows the version of pastel.

## EXAMPLES

Print the 'foo' string to the standard output in green color:

  pastel green foo


Print the 'foo' string to the standard output in green color and on the red background:

  pastel green on_red foo


Read the content 'foo' and pipe it to pastel to print to standard output:

    echo foo | pastel green


## EXIT STATUS

The `pastel` utility exits 0 on success, and 1 if an error occurs.

## SEE ALSO

The pastel readme https://github.com/piotrmurach/pastel

## AUTHOR

The `pastel` utility is written by Piotr Murach \<piotr@piotrmurach.com\>

Website: https://ttytoolkit.org
