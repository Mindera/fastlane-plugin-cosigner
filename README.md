# Cosigner ✍️

Fastlane plugin which enables iOS workflows to change the Xcode project's code signing settings before building a target, being your "cosigner".

## Why do I need it? 🤔

This action is especially useful to avoid having to configure the Xcode project with a "static" set of code signing configurations for:

 * Code Signing Style (Xcode8+): Manual / Automatic (originally Provisioning Style on Xcode 8)
 * Code Signing Identity: iPhone Development / iPhone Distribution
 * Provisioning Profile UUID (Xcode 7 and earlier)
 * Provisioning Profile Name (Xcode8+)
 * Team ID
 * Application Bundle identifier

By being able to configure this before each build (e.g. gym call), it allows having separate sets of code signing configurations on the same project without being "intrusive".

Some practical scenarios can be for example:

 * Xcode project in which two different Apple Developer accounts/teams are required (e.g. 1 for Development and 1 for Release)
 * Shared Xcode project where teams have different code signing configurations (e.g. Automatic vs Manual Provisioning Style)

## How to use it? 👀

1. Run `fastlane add_plugin cosigner` on your project folder.
2. Invoke `cosigner` in your Fastfile and provide the required options.
3. Enjoy your new dynamic code signing setup! ✨

### Available options 🛠

| Option | Description | Environment Variable | Default | Optional |
| --- | --- | --- | --- | --- |
| `xcodeproj_path` | The Xcode project's path | `PROJECT_PATH` ||
| `scheme` | The Xcode project's scheme | `SCHEME ` ||
| `build_configuration` | Build configuration ("Debug", "Release", ...) | `BUILD_CONFIGURATION ` ||
| `code_sign_style` | Code signing style ("Automatic", "Manual ") (Xcode 8+, previously `provisioning_style`)  | `CODE_SIGN_STYLE` (previously `PROVISIONING_STYLE`) | "Manual" ||
| `code_sign_identity ` | Code signing identity type ("iPhone Development", "iPhone Distribution") |`CODE_SIGN_IDENTITY ` | "iPhone Distribution" ||
| `profile_name ` | Provisioning profile name to use for code signing (Xcode 8+) | `PROVISIONING_PROFILE_SPECIFIER ` |||
| `profile_uuid ` | Provisioning profile UUID to use for code signing (Xcode 7 and earlier)  | `PROVISIONING_PROFILE ` || ✔️ |
| `development_team ` | Development team identifier | `TEAM_ID ` |||
| `bundle_identifier ` | Application Product Bundle Identifier | `APP_IDENTIFIER ` || ✔️ |

### Example usage 🔍

**.env.default**

```ruby
TEAM_ID=XYZ1234
SCHEME=MyAppScheme
PROJECT_PATH='/path/to/MyApp.xcodeproj'
```

**Fastfile**

```ruby
lane :build do
  app_identifier = "com.my.app.identifier"
  configuration = "Release"

  match(type: "adhoc", app_identifier: app_identifier)

  cosigner(
    build_configuration: configuration,
    profile_name: ENV['sigh_' + app_identifier + '_adhoc_profile-name'],
    profile_uuid: ENV['sigh_' + app_identifier + '_adhoc']
  )

  gym(
    configuration: configuration,
    export_options: {
      method: "ad-hoc"
    }
  )
end
```

## Precautions ⚠️

Please be aware that `cosigner` effectively **modifies your Xcode project file**, so be careful if your workflow commits changes to source control, or if steps further down your pipeline can be affected by the resulting modifications.

## Contributing 🙌

See [CONTRIBUTING](https://github.com/Mindera/fastlane-plugin-cosigner/blob/master/CONTRIBUTING.md).

### With ❤️ from [Mindera](https://www.mindera.com) 🤓