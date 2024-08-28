# makebetter

An awk script that reads a Makefile and modifies to make the first target help that prints all the targets. Make the file exectuable and run with ``./makebetter.awk Makefile`.

Note modified contents printed to stdout. A good way to make it inplace is `./makebetter.awk Makefile | sponge Makefile`
