# Mortal Kombat 4 Strip 1.0 by SORCERER #
*Released 10-Nov-1999*

***Read Me First***

 I (SORCERER) decided to make a small program that will let me (and you) view
the inside of the best game - Mortal Kombat 4.
 It also lets you alter the MK4 game by changing graphics/sounds. You can also
modify the geometry (3D Models) of MK4, but it is a rather hard process and you
should have 3D Studio Max. See http://sorcerersoft.com/mk4strip/ for details.

 I am a great fan of the MK series. I know that there is going to be a
Mortal Kombat Gold for the Sega Dreamcast and I think that possibly there is
an opportunity to convert the MK GOLD characters to MK4.

 If you have ever played the MK4 on arcade you should know that the Arcade
version is MUCH BETTER!!! It is because the arcade version (as rumored) has
3,000 polygons per fighter. The PC version has only about 800!!! Thanks to
Eurocom Entertainment Software.
 I think that it was made to achieve faster gameplay on slow (compared to
nowadays) computers. If they (Eurocom) could have added the tesselation to
the MK4 it would have been great. But they didn't and so the MK4 has poor
graphics.

 My aim is to add details or maybe even characters and stages to the MK4.
I cannot do it alone. If you can somehow assist me in this - please e-mail me.

 Currently I am looking for MK4 ROM for Arcade and MK Gold image for DreamCast.


***SORCERER***

 I am a software developer from Russia. Please see my shareware logic game
"Lines'98" at http://sorcerersoft.com/lines98/

My e-mail is: root@sorcerersoft.com


***Usage***

You should unzip everything (including directory structure
 "pkunzip -d mk4strip.zip") in any directory (no long file names please).
And then copy the "filesys.dat" there.
 Run the "begin.bat". It will decompile the "filesys.dat" (which should be
placed in the "mk4s.exe" directory) into 799 files (sounds, 3d geometry and
textures). Then run the "continue.bat" to convert the files to appropriate
formats. Don't erase any of the directories!!!
 After running these two BATs you will have lots of MK4 files.

 Currently you have an ability to change the graphics and sound files and then
recompile the "filesys.dat" and enjoy your masterpiece.


***Important***

 You MUST NOT alter the directory structure!!!
 You MUST have at least 100Mb free on a hard drive.

 If you plan to change the textures in MK4, you should know that pixel with
RGB=0,0,0 is transparent. See "Files" section on MK4Strip site.


***Commands***

- mk4s decompile                  - decompiles the DAT file.
- mk4s compile                    - compiles the DAT file from 01Vs, ESFs, XXXs.
- mk4s bmp2gfx file.bmp           - converts from BMP to GFX. Only 256*256
                                   TrueColor BMPs are supported!
- mk4s gfx2bmp file.gfx [noview]  - converts from GFX to BMP. If 'noview' then
                                   no graphics is drawn when converting. Faster.


***Files***

- GFX - compressed (RLE-like) 256*256 15bit texture file. Can be converted to BMP
- GEO - geometry file. Can be converted to OBJ and viewed in 3D Exploration.
- ESF - not converted to WAV sounds. Koming soon.
- MISC\r002 - possibly the movements file.
- MISC\r001 - ???
- MISC\r791.tga - 2D font.
- BMP - converted from GFX textures. View them in any Graphics Viewer/Editor.


***To Do***

ESF


***Note***

 If you have an idea on "upgrading" the "Mortal Kombat 4" - please, let me know.
 If you can make new graphics for fighters/background - e-mail me.


***Changes***

- 0.6: BMP2GFX fix - should work OK now.
- 0.7: Fixed (almost) conversion from GEO to OBJ.
- 0.8: Conversion from GEO to RAX. Fixed texturing.
- 1.0: GEO to OBJ Fixed. No need to switch "Hidden Geometry" to ON.




# 3D modification for MK4. #
*See http://sorcerersoft.com/mk4strip/ for details.*

0. You can convert only models with ONE texture (fighters) but NOT stages or
   anything else.

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


***Used Utilities***

- Far file manager (http://www.rarsoft.com)
- ACD See 32 (http://www.acdsys.com)
- 3D Exploration by X Dimension (http://www.xdsoft.com/explorer/)
- Hacker's View by SEN
- Borland Pascal 7.0
- Borland C++ 5.01
- Microsoft Visual C++
