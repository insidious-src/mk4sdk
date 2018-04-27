cmake_minimum_required(VERSION 2.8)

project("MK4TR")

set(MK4SDK_VERSION_MAJOR 2)
set(MK4SDK_VERSION_MINOR 0)
set(MK4SDK_VERSION ${MK4SDK_VERSION_MAJOR}.${MK4SDK_VERSION_MINOR})

## assets

add_custom_target(goro ASSET
    # primary skin
    )

add_custom_target(kano ASSET
    # primary skin
    )

add_custom_target(kitana ASSET
    # primary skin
    )

add_custom_target(reptile ASSET
    # primary skin
    )

add_custom_target(reiko ASSET
    # primary skin
    # shao kahn skin
    )

add_custom_target(sonya ASSET
    # primary skin
    )

add_custom_target(noob_saibot ASSET
    # primary skin
    utils/view/r787-00.ase
    utils/view/r787-0.bmp
    # alternate skin
    #utils/view/R713-00.ase
    #utils/view/r713-0.bmp
    )

add_custom_target(tanya ASSET
    # primary skin
    utils/view/R005-00.ase
    utils/view/r005-0.bmp
    )

add_custom_target(subzero ASSET
    # primary skin
    utils/view/R020-00.ase
    utils/view/r020-0.bmp
    )

add_custom_target(quan_chi ASSET
    # primary skin
    utils/view/r008-00.ase
    utils/view/r008-0.bmp
    )

add_custom_target(scorpion ASSET
    # primary skin
    utils/view/R009-00.ase
    utils/view/r009-0.bmp
    # alternate skin
    utils/view/R741-00.ase
    utils/view/r741-0.bmp
    )

add_custom_target(filesys DATAFILE
    noob_saibot
    #tanya
    #subzero
    #quan_chi
    #scorpion
    #goro
    #reiko
    #sonya
    #kano
    #kitana
    #reptile
    )

add_custom_target(game.json HEX
    about.json
    text.json
    gameplay.json
    )

add_custom_target(mk4 GAME
    game.json
    filesys.dat
    )
