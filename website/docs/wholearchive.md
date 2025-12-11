Creates a new workspace.

```lua
wholearchive ("library")
```

### Parameters ###

`library` is a .

### Availability ###

Premake 5.0-beta8 or later.

### Examples ###

```lua
project 'some_library'
    kind 'StaticLib'
    defines { 'MAKING_DLL_LIB' } -- for dllexport
-- ..
project 'some_dll'
    kind 'SharedLib'
    defines { 'MAKING_DLL_LIB' } -- for dllexport
    links 'some_library'
    wholearchive 'some_library'
-- ..
```

### See Also ###

* [project](project.md)
* [links](links.md)
