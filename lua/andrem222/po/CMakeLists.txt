cmake_minimum_required(VERSION 3.31.6)
project(Internationalization)

set(NVIM_DIR "${CMAKE_SOURCE_DIR}/../../..")
set(TRANSLATION_DIR "${CMAKE_SOURCE_DIR}")
set(TEMPLATE_FILE "${TRANSLATION_DIR}/template.pot")
set(TRANSLATION_SCRIPT_TYPE "po")

set(LANGUAGES en ja)

file(MAKE_DIRECTORY ${TRANSLATION_DIR})

add_custom_command(
  OUTPUT ${TEMPLATE_FILE}
  COMMAND bash -c
    "mkdir -p '${TRANSLATION_DIR}' && cd '${NVIM_DIR}' && xgettext -L Lua --keyword=Msgstr --directory=. -o '${TEMPLATE_FILE}' $(find . -name '*.lua')"
  COMMENT "Generating template.pot from Lua source"
  VERBATIM
)

foreach(LANGUAGE ${LANGUAGES})
    set(PO_FILE "${TRANSLATION_DIR}/${LANGUAGE}.${TRANSLATION_SCRIPT_TYPE}")

    add_custom_command(
    OUTPUT ${PO_FILE}
    DEPENDS ${TEMPLATE_FILE}
    COMMAND ${CMAKE_COMMAND} -E copy ${TEMPLATE_FILE} ${PO_FILE}
    COMMAND bash -c
      "sed -i '' 's/charset=CHARSET/charset=UTF-8/' '${PO_FILE}'"
    COMMENT "Creating ${LANGUAGE}.po from template"
    VERBATIM
    )

    add_custom_target(${LANGUAGE}_po ALL DEPENDS ${PO_FILE})
endforeach()

add_custom_target(update_translations ALL
  DEPENDS ${TEMPLATE_FILE}
)
