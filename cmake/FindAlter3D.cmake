find_package(PackageHandleStandardArgs)

find_path(ALTER3D_DIR ase23d.exe stripe3d.exe
    HINTS ${CMAKE_SOURCE_DIR}/utils
    )

find_program(ALTER3D_ASE23D
    NAMES ase23d.exe ase23d
    HINTS ${CMAKE_SOURCE_DIR}/utils
    )

find_program(ALTER3D_STRIPE3D
    NAMES stripe3d.exe stripe3d
    HINTS ${CMAKE_SOURCE_DIR}/utils
    )

find_program(ALTER3D_STRIPE
    NAMES stripe.exe stripe
    HINTS ${CMAKE_SOURCE_DIR}/utils
    )

find_package_handle_standard_args(ALTER3D REQUIRED_VARS
    ALTER3D_DIR
    ALTER3D_ASE23D
    ALTER3D_STRIPE3D
    ALTER3D_STRIPE
    )

if(ALTER3D_FOUND AND NOT TARGET Alter3D::ase23d)
    add_custom_target(Alter3D::ase23d UNKNOWN IMPORTED)
    set_target_properties(Alter3D::ase23d PROPERTIES
        IMPORTED_LOCATION "${ALTER3D_ASE23D}"
        )
endif()

if(ALTER3D_FOUND AND NOT TARGET Alter3D::stripe3d)
    add_custom_target(Alter3D::stripe3d UNKNOWN IMPORTED)
    set_target_properties(Alter3D::stripe3d PROPERTIES
        IMPORTED_LOCATION "${ALTER3D_STRIPE3D}"
        )
endif()

if(ALTER3D_FOUND AND NOT TARGET Alter3D::stripe)
    add_custom_target(Alter3D::stripe UNKNOWN IMPORTED)
    set_target_properties(Alter3D::stripe PROPERTIES
        IMPORTED_LOCATION "${ALTER3D_STRIPE}"
        )
endif()

mark_as_advanced(ALTER3D_DIR ALTER3D_ASE23D ALTER3D_STRIPE3D ALTER3D_STRIPE)
