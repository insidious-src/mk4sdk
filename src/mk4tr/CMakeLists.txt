## assets

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
