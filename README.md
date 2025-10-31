# PassMan - Secure Password Manager

Password manager application that helps you securely store and manage your sensitive information.

## Features

- Store account credentials securely
- Save bank card information
- Choice of encryption methods (AES-256-CBC or XOR)
- User-friendly interface
- Offline storage for enhanced security

## Security

PassMan implements robust security measures:
- Choose between AES-256-CBC or XOR encryption
- All sensitive data is encrypted
- No cloud storage - all data stays on your device
- No internet permission required
## Architecture

Built using:
- Hive for secure local storage
- Provider for state management
- Custom encryption implementation
## Getting Started

1. Clone the repository
2. Run `flutter pub get`
3. Build and run the application

## Development

Built with:
- Flutter
- Dart
- SQLite for local storage
- crypto package for encryption

## Privacy

Your data never leaves your device. All sensitive information is encrypted locally using your choice of encryption method.

## Contributing

Feel free to submit issues and pull requests.

## License

This project is licensed under the MIT License.
