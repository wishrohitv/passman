# PassMan - Secure Password Manager

<p align="center">
    <img width="200" src="assets/logo/passmanlogo.png" alt="PassMan Logo">
</p>

PassMan is a secure, offline password manager that helps you store and manage sensitive information locally on your device.

## Features

- Securely store account credentials (username, password, notes)
- Save bank card information
- Choice of encryption methods: AES-256-CBC or XOR
- User-friendly, responsive UI
- Offline-only storage (no cloud syncing)
- Option to export/import encrypted backups
- Password generator

## Security

- All sensitive data is encrypted before storage
- Choose between AES-256-CBC or XOR encryption implementations
- No internet permission required — data never leaves your device

## Architecture

Built using:
- Hive for secure local storage
- Provider for state management
- MVVM (Model-View-ViewModel) architecture
- Custom encryption components (plus optional use of the crypto package)

## Multilanguage (Localization) Support

PassMan includes multilanguage support to improve accessibility for users worldwide.

Supported languages:
- 🇬🇧 English (default)
- 🇮🇳 Hindi
- 🇷🇺 Russian
- 🇪🇸 Spanish
- 🇨🇳 Chinese
- 🇮🇳 Bhojpuri (under development)


## Getting Started

1. Clone the repository
2. Run `flutter pub get`
3. Build and run the application with `flutter run`

## Development

- Flutter for UI
- Dart as the programming language
- Use Hive for local data persistence
- Encryption logic implemented in-app; `crypto` package optionally used for cryptographic primitives

## Privacy

Your data stays on your device. All sensitive information is encrypted locally and never uploaded to external servers.

## Contributing

Contributions, issues, and pull requests are welcome. Please follow the repository's contribution guidelines.

## License

This project is licensed under the MIT License.
