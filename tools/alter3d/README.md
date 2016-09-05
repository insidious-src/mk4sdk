3D modification for MK4.    See http://sorcerersoft.com/mk4strip/ for details.

0. You can convert only models with ONE texture (fighters) but NOT stages or
   something.

1. Convert the GEO file to RAX. BUT!!! For fighters use command
   "geo2obj rXXX.geo allinone"
   ex. geo2obj r008.geo allinone

2. You will get the file r008-00.rax. Open it in 3D Exploration.
   There are no textures - it is OK.

3. In 3D Expl. select File\Save As... and save as r008.obj.

4. Run 3D Studio MAX. And import the r008.obj into it.
   Open material editor and open "MAPS" rollover. Click on "Diffuse Color" and
   then "bitmap". Select the texture (r008-0.bmp will do OK). Assign material to
   selection. If you do not assign material you will not be able to convert to
   GEO!

5. Modify the model (Smooth for example).

6. Select "File\Export" in 3DS Max. Select ASCII (*.ASE).
   On the ASCII Export Dialog switch to on the following:
   Mesh definition, Materials, Geomteric, Mesh Normals, Mapping Coordinates.
   Save as "r008.ase".

7. Edit the HRA-file for your export model. Sample file for r008.ase is in
   distribution pack. This HRA file is just an enumeration of object names with
   a plus ("+") before each name.
   BUT!!! The first 3 lines are important (*GROUP,*SUBGROUP,*ANIOBJ).
   Do not modify them!!!

8. Run ASE23D. Input filename should be "r008.ase". Press "Go!"

9. Run "stripe3d.exe" and wait.

10. You will get the "r000.geo". Rename it to "r008.geo" and recompile the DAT.
