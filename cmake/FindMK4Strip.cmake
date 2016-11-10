find_package(PackageHandleStandardArgs)

find_path(MK4STRIP_DIR mk4s.exe fnd-obj.exe
            HINTS ${CMAKE_SOURCE_DIR}/utils
            )

find_program(MK4STRIP_CORE
            NAMES mk4s.exe mk4s
            HINTS ${CMAKE_SOURCE_DIR}/utils
            )

find_program(MK4STRIP_GEOMETRY
            NAMES fnd-obj.exe fnd-obj
            HINTS ${CMAKE_SOURCE_DIR}/utils
            )

find_package_handle_standard_args(MK4STRIP REQUIRED_VARS
    MK4STRIP_DIR
    MK4STRIP_CORE
    MK4STRIP_GEOMETRY
    )

if(MK4STRIP_FOUND AND NOT TARGET MK4STRIP::Core)
    add_custom_target(MK4STRIP::Core UNKNOWN IMPORTED)
    set_target_properties(MK4STRIP::Core PROPERTIES
        IMPORTED_LOCATION "${MK4STRIP_CORE}"
        )
endif()

if(MK4STRIP_FOUND AND NOT TARGET MK4Strip::Geometry)
    add_custom_target(MK4Strip::Geometry UNKNOWN IMPORTED)
    set_target_properties(MK4Strip::Geometry PROPERTIES
        IMPORTED_LOCATION "${MK4STRIP_GEOMETRY}"
        )
endif()

mark_as_advanced(MK4STRIP_DIR MK4STRIP_CORE MK4STRIP_GEOMETRY)
