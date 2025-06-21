# Translation Section

> [!WARNING]
> This section is meant to be used to make the translations
> scripts and update if new section has been made.

## Requirements

- cmake
- gettext

## Starting

### Add new language

- To add a new language you msut first include it in [/lua/andrem222/po/CMakeLists.txt](/lua/andrem222/po/CMakeLists.txt)

```cmake
set(LANGUAGES en ja) # <- Add new language locale here
```

### First time making translation type

- This updates and makes new translations

```sh
cmake ..
build
```

### Running a second time

- This updates and makes new translations

```sh
build
```
