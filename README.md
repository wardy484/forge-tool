# Forge Buddy

## Building a an update for release


## Building a new dmg

```
flutter build macos --release
```

Run the following command in the project root:
```
appdmg installer/macos_dmg/config.json installer/macos_dmg/forge_buddy.dmg
```

The resulting dmg file will be output to:
```
/installer/macos_dmg/forge_buddy.dmg
```