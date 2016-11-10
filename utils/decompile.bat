@echo off

set MK4SLOG="mk4s_decompile_output.log"

mk4s decompile > "%MK4SLOG%" &&
echo "filesys.dat successfully decompiled"
