@echo off

set MK4SLOG="mk4s_compile_output.log"

mk4s compile > "%MK4SLOG%" &&
echo "filesys.dat successfully compiled"

move filesys.dat filesys.dat.bak &&
echo "the old one renamed to filesys.dat.bak"

move filesys.new filesys.dat
